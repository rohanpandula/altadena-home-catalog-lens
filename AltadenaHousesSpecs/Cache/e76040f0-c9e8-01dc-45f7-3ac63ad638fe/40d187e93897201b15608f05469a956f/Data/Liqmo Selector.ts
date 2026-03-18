import {
    LiqmoGlassBase,
    LiqmoGlass,
    ShapeSettings,
    ButtonDefinitions,
    ParentInteractionPositions,
    UserBtnEventMap,
    TouchEndEventArgsExtra
} from "./LiqmoGlass";
import { BatchUtils } from "./HelpersForLS";
import { NumericLike, DampEntry } from "./Damper";

@typedef
export class SelectedIconSetup{
    @input
    @label("Icon Magnification")
    selectorMagnification: number;

    @input
    @allowUndefined
    @label("Icon Set")
    icon1: Texture;

    @input
    @label("Mono Color")
    useColorAlt: boolean = false

    @input
    @showIf("useColorAlt")
    @widget(new ColorWidget())
    iconColorAlt: vec3 = new vec3(0, 0, 0)

    @input
    @showIf("useColorAlt")
    @widget(new SliderWidget(0, 3, 1))
    colorChannelAlt: number = 0
}

@typedef
export class CustomBaseInteraction{
    @input
    debugOnScreen: boolean
    
    @input
    @widget(new SpinBoxWidget(-100,100,0.001))
    position: vec2 = new vec2(0,0)
    
    @input
    @widget(new SpinBoxWidget(-100,100,0.001))
    scale: vec2 = new vec2(1,1)
}


@component
export class LG_Selector extends LiqmoGlassBase {
    @input
    shapeSettings: ShapeSettings;

    @ui.separator
    @ui.group_start("Remap Touch Boundries")
    @ui.label("<p style='color: #3E434E; background-color: #818C9A; text-align: center;'>Boundry of button shape: <em><strong>[-1, 1, -1, 1]</strong></em><br>You need to remap these values to boundry of your menu<br>v</p>")
    @input
    min: vec2 = new vec2(-1,-1);
    @input
    max: vec2 =new vec2(1,1);
    @ui.group_end

    @ui.separator
    @input
    selectedIconsSetup: SelectedIconSetup;

    @ui.separator
    @input
    @widget(
        new ComboBoxWidget([
            new ComboBoxItem('Default', 0),
            new ComboBoxItem('Switch', 1),
            new ComboBoxItem('Slider', 2)
        ])
    )
    buttonType: number = 0;
    @input
    useCustomTouchArea: boolean = false
    @input
    @showIf("useCustomTouchArea")
    customBaseInteraction: CustomBaseInteraction;

    @input
    material: Material;

    @input
    debugMaterial: Material;

    @input
    invisibleTex: Texture;

    // Hide abstract class inputs
    interactions: any = [];

    onAwake() {
        global.touchSystem.touchBlocking = true;

        const parentButton: LiqmoGlassBase | undefined = this.sceneObject
            .getParent()
            .getComponents("Component.ScriptComponent")
            .find((x): x is LiqmoGlassBase => x instanceof LiqmoGlassBase);

        // Snatch and override parent button properties
        if (parentButton) {
            var parentSnatch = parentButton._initiateThumb(this.invisibleTex);
            this.iconSettings = parentSnatch.iconSettings;
        } else {
            throw new Error("Must be child of a Liqmo Glass Object");
        }

        //Add base interaction for the selection thingy
        this.interactions.unshift({
            id: "_customBase",
            groupId: "_buttonBase",
            position: this.useCustomTouchArea
                ? this.customBaseInteraction.position
                : parentSnatch.shapeSettings.shapePosition,
            scale: this.useCustomTouchArea
                ? this.customBaseInteraction.scale
                : parentSnatch.shapeSettings.shapeScale,
            enabled: true,
        });

        //Set initial values
        this.material = this.material.clone();
        this.debugMaterial.mainPass.isDebug = this.customBaseInteraction.debugOnScreen;
        this.damper.dampStrength = this.dampSpeed;

        //Selector material exceptions
        this.material.mainPass.magnification = this.selectedIconsSetup.selectorMagnification;

        if(this.selectedIconsSetup.icon1) {
            for(const s in this.selectedIconsSetup){
                this.material.mainPass[s] = this.selectedIconsSetup[s];
            }
        } else {
            this.material.mainPass.useAlt = false;
        }

        //Add SceneObject
        const mainButton = BatchUtils.createBatchSceneObject(
            this.sceneObject,
            "_button",
            ["ScreenTransform", "Image"],
            true
        );

        mainButton.Image.stretchMode = StretchMode.Fit;
        mainButton.Image.mainMaterial = this.material;
        mainButton.Image.setRenderOrder(this.renderOrder);

        // Initiate Liqmo Glass behaviour
        this.LG = new LiqmoGlass(
            this,
            this.material,
            this.dampSpeed,
            this.glassSettings,
            this.touchSettings,
            this.shapeSettings,
            this.iconSettings
        );
        this.LG.bindScreenToInteraction = this.bindTouchToInteraction;

        // Initiate/map button interactions
        this.BID = new ButtonDefinitions(
            this.sceneObject,
            this.interactions,
            this.debugMaterial,
            this.sceneObject.layer,
            this.renderOrder + 1,
            () => (this.LG.touchEnabled = true),
            () => {
                if (this.bindTouchToInteraction) {
                    this.LG.touchEnabled = false;
                    this.LG.screenTouchCanceled = true;
                }
            }
        );
        this.BID.setSafeAreaFix(this);
        this.buttonFuncDefinitions = this.BID.buttonObjects;

        //INTERACTIONS
        const selectorInteraction = this.BID.getButtonObject("_customBase");
        const remapOuts = this.findMinMaxVec2Components(parentSnatch.interactionPositions);

        let damp: DampEntry<NumericLike>;
        let initPosition: vec2;
        let lastPosition: vec2 = selectorInteraction.ScreenTransform.localPointToScreenPoint(this.vec2Remap(this.shapeSettings.shapePosition, remapOuts.min, remapOuts.max, this.min, this.max));
        let lastSnapped: vec2 = this.snapToClosest(this.shapeSettings.shapePosition, parentSnatch.interactionPositions).position;
        let dragging: boolean = false;

        selectorInteraction.InteractionComponent.onTouchStart.add((v) => {
            initPosition = v.position;
            if(!lastPosition) lastPosition = v.position;
            if(damp) this.damper.removeValue(damp);
        })

        selectorInteraction.InteractionComponent.onTouchMove.add((v) => {
            if(initPosition.distance(v.position)<0.03 && !dragging) return;

            dragging = true;
            lastPosition = v.position;

            const pos = selectorInteraction.ScreenTransform.screenPointToLocalPoint(v.position);
            this.material.mainPass.shapePosition = this.vec2Remap(pos, this.min, this.max, remapOuts.min, remapOuts.max);
        });
        
        //TODO FOR FUTURE: This one here a bit shit
        selectorInteraction.InteractionComponent.onTouchEnd.add((v) => {
            const lastLocalPosition = selectorInteraction.ScreenTransform.screenPointToLocalPoint(lastPosition);
            const lastLerped = this.vec2Remap(lastLocalPosition, this.min, this.max, remapOuts.min, remapOuts.max);
            
            const localPosition = selectorInteraction.ScreenTransform.screenPointToLocalPoint(v.position);
            const lerped = this.vec2Remap(localPosition, this.min, this.max, remapOuts.min, remapOuts.max);
            
            let snapped = this.snapToClosest(lerped, parentSnatch.interactionPositions).position;
            let buttonId = parentSnatch.interactionPositions.find(x => snapped === x.position).id;

            if(lastSnapped && this.buttonType === 1 && lastSnapped.distance(snapped) === 0) {
                snapped = parentSnatch.interactionPositions.find(x => buttonId !== x.id).position;
                buttonId = parentSnatch.interactionPositions.find(x => snapped === x.position).id;
            }

            const unlerp = this.vec2Remap(lerped, remapOuts.min, remapOuts.max, this.min, this.max); //Lerped but min/max of "0" clamped or u know iste
            const snappedUnlerp = this.vec2Remap(snapped, remapOuts.min, remapOuts.max, this.min, this.max); //Snapped local pos
            const sPosition = selectorInteraction.ScreenTransform.localPointToScreenPoint(snappedUnlerp); //Screen translated snapped pos

            const touchEndArgsExtra = v as TouchEndEventArgsExtra;
            touchEndArgsExtra.positionInRect = unlerp;
            touchEndArgsExtra.snappedPosInRect = this.vec2Remap(snappedUnlerp, this.min, this.max, vec2.one().uniformScale(-1), vec2.one());

            if(this.buttonType !== 2) {
                const obj = parentSnatch.userButtonFunctions[buttonId].definitions;
                obj.forEach(x => x(touchEndArgsExtra));
            } else {
                const obj = this.findAnyDefinition(parentSnatch.userButtonFunctions).definitions;
                if(obj){
                    obj.forEach(x => x(touchEndArgsExtra));
                } else {
                    print("Slider needs at least one definitions, IDK ABOUT THIS ERROR MESSAGE")
                }
            }

            damp = this.damper.addValue(lastLerped, (v)=>{
                this.material.mainPass.shapePosition = v;
            })
            this.damper.setTarget(damp, this.buttonType === 2 ? lerped : snapped);

            lastSnapped = snapped
            lastPosition = this.buttonType === 2 ? v.position : sPosition;
            dragging = false;
        })
    }

    private snapToClosest(v: vec2, targets: Array<ParentInteractionPositions>) {
        if (!targets.length) throw new Error("Interactions array is empty");

        let closest = targets[0];
        let minDist = v.distance(closest.position);

        for (let i = 1; i < targets.length; i++) {
            const t = targets[i];
            const dist = v.distance(t.position);
            if (dist < minDist) {
                minDist = dist;
                closest = t;
            }
        }

        return closest;
    }

    private findMinMaxVec2Components(targets: Array<ParentInteractionPositions>): { min: vec2, max: vec2 } {
        if (!targets.length) throw new Error("Interactions array is empty");

        const min = new vec2(Infinity, Infinity);
        const max = new vec2(-Infinity, -Infinity);

        for (const { position: p } of targets) {
            max.x = Math.max(max.x, p.x);
            max.y = Math.max(max.y, p.y);

            min.x = Math.min(min.x, p.x);
            min.y = Math.min(min.y, p.y);
        }

        return { min, max };
    }

    private vec2Remap(pos: vec2, minIn: vec2, maxIn: vec2, minOut: vec2, maxOut: vec2): vec2{
        return new vec2(
            (minIn.x === maxIn.x) ? 0 : MathUtils.remap(pos.x, minIn.x, maxIn.x, minOut.x, maxOut.x),
            (minIn.y === maxIn.y) ? 0 : MathUtils.remap(pos.y, minIn.y, maxIn.y, minOut.y, maxOut.y),
        );
    }

    private findAnyDefinition(obj: Record<string, UserBtnEventMap>): UserBtnEventMap | null {
        let v = null
        for (const [key, val] of Object.entries(obj)) {
            if (val) {
                v = val;
            }
        }
        return v;
    }
}