import { Damper, isNumericLike } from "./Damper";
import { BatchSceneObject, BatchUtils, QuickUtils } from "./HelpersForLS";

@typedef
export class GlassSettings{
    @input
    thickness: number = 2
    
    @input
    frost: number = 1

    @input
    @widget(new SliderWidget(0, 1, 0.01))
    transparency: number = 0

    @input
    @widget(new SliderWidget(0, 1, 0.01))
    material: number = 0.7

    @input
    @label("Use Texture")
    useTex: boolean = false

    @input
    @showIf("useTex", false)
    @widget(new ColorWidget())
    @label("Color Tint")
    baseColor: vec4 = new vec4(0,0,0,1)

    @input
    @showIf("useTex")
    @label("Texture")
    @allowUndefined
    extraTex: Texture;

    @ui.label("")
    @input
    @label("Flat Lighting")
    topLighting: boolean = false
    
    @input
    @widget(new SliderWidget(0, 360, 1))
    lightAngle: number = 1
    
    @input
    @label("Light Bleed")
    bleed: number = 10
    
    @ui.label("")
    @input
    @label("⚠️ Chromatic Aberration")
    @hint("Higher values may impact performance")
    chromaticAbbr: number = 1
    
    @input
    @label("⚠️ On Surface")
    @hint("May impact performance")
    chromaticAbbrOnSurface: boolean = false

    @ui.label("")
    @input("int")
    @label("⚠️ Render Quality")
    @hint("Higher values will impact performance")
    quality: number = 20
}

@typedef
export class ShapeSettings{
    @input
    shapeScale: vec2 = new vec2(1, 1)
    
    @input
    @widget(new SpinBoxWidget(-100,100,0.001))
    shapePosition: vec2 = new vec2(0, 0)

    @ui.label("")
    @input
    @widget(new SliderWidget(0, 1, 0.01))
    shapeSoftness: number = 0.4
    
    @input
    @widget(new SliderWidget(0, 1, 0.01))
    cornerRadius: vec4 = new vec4(0.25, 0.25, 0.25, 0.25)
}

@typedef
export class MorphShapeSettings{
    @input
    shapeScale: vec2 = new vec2(1, 1)
    
    @input
    shapePosition: vec2 = new vec2(0, 0)

    @ui.label("")
    @input
    @widget(new SliderWidget(0, 1, 0.01))
    shapeSoftness: number = 0.4
    
    @input
    @widget(new SliderWidget(0, 1, 0.01))
    cornerRadius: vec4 = new vec4(0.25, 0.25, 0.25, 0.25)
    
    @ui.label("")
    @ui.separator
    @ui.label("<em>Morph Child Offsets</em>")
    @input
    childScale: vec2 = new vec2(1, 1)
    
    @input
    childOffset: vec2 = new vec2(0, 0)
    
    @input
    @widget(new SliderWidget(0, 1, 0.01))
    childRadius: vec4 = new vec4(0.25, 0.25, 0.25, 0.25)
}

@typedef
export class IconSettings{
    @input
    iconScale: number = 1
    
    @input
    iconPosition: vec2 = new vec2(0, 0)

    @input
    @widget(new SliderWidget(0, 10, 0.01))
    maxBlur: number = 1

    @ui.label("")
    @input
    @label("Mono Color")
    useColor: boolean = false

    @input
    @showIf("useColor")
    @widget(new ColorWidget())
    iconColor: vec3 = new vec3(0, 0, 0)

    @input
    @showIf("useColor")
    @widget(new SliderWidget(0, 3, 1))
    colorChannel: number = 0
}

@typedef
export class TouchSettings{
    @input
    @label("Stretch")
    @widget(new SliderWidget(0, 1, 0.01))
    stretchStrength: number = 0.1
    
    @input
    @label("Press")
    @widget(new SliderWidget(0, 1, 0.01))
    pressDownStrength: number = 0.1
    
    @input
    @label("Nudge")
    @widget(new SliderWidget(0, 1, 0.01))
    nudgeStrength: number = 0.1
    
    @input
    @label("Show light on press")
    pressLight: boolean = true
    
    @input
    @label("Show light on hover")
    hoverLight: boolean = true
    
    @input
    @label("Strecth every angle")
    constantStretch: boolean = false
}

export class MaterialTouchSetup{
    p0: vec2 = new vec2 (0,0);
    p1: vec2 = new vec2 (0,0);
    pressure: number = 0 ;
}

@typedef
export class InteractionSetup {
    @input
    id: string

    @input
    groupId: string
    
    @input
    @widget(new SpinBoxWidget(-100,100,0.001))
    position: vec2 = new vec2(0,0)
    
    @input
    @widget(new SpinBoxWidget(-100,100,0.001))
    scale: vec2 = new vec2(1,1)

    @input
    enabled: boolean = true
}

@typedef
export class InteractionsInput{
    @input
    debugOnScreen: boolean;
    
    @input
    addInteraction: Array<InteractionSetup>;
}

export declare class TouchEndEventArgsExtra extends TouchEndEventArgs{
    positionInRect: vec2;
    snappedPosInRect: vec2;
}

export class UserBtnEventMap {
    private funcInteractions: Record<symbol, { fn: (x?: any) => void; reg: EventRegistration }> = {};
    public buttonObject: BatchSceneObject;
    
    public add<T extends TouchEndEventArgsExtra>(fn: (arg?: T) => void) {
        const id = Symbol();
        const reg = this.buttonObject.InteractionComponent.onTouchEnd.add(fn);

        this.funcInteractions[id] = { fn, reg };

        return id;
    }

    public remove(id: symbol) {
        const data = this.funcInteractions[id];
        if (!data) return;

        this.buttonObject.InteractionComponent.onTouchEnd.remove(data.reg);

        delete this.funcInteractions[id];
    }

    get definitions() {
        return Object.getOwnPropertySymbols(this.funcInteractions).map(sym => this.funcInteractions[sym].fn);

    }
}

export class ButtonDefinitions{
    public buttonObjects: Record<string, UserBtnEventMap> = {};
    public buttonGroups: Record<string, Array<string>> = {};

    constructor(
        private sceneObject: SceneObject, 
        private buttonMapData: Array<InteractionSetup>, 
        material: Material, layer: LayerSet, 
        renderOrder: number, 
        touchStartCallback: () => void = function(){}, 
        touchEndCallback: () => void = function(){}
    ){
        const aspect = global.scene.captureTarget.control.getAspect();
        
        let index = 0;
        for(const btn of buttonMapData) {
            if(!btn.id) console.warn(`Provide a button id for ${index}th interaction`);

            const current = new UserBtnEventMap();
            current.buttonObject = BatchUtils.createBatchSceneObject(
                sceneObject, 
                `_${btn.id}`, 
                ["ScreenTransform", "Image", "InteractionComponent"],
            );
            
            // const parentSize = current.buttonObject.Object.getParent().getComponent("Component.ScreenTransform").anchors.getSize().uniformScale(0.5);
            // const parentRatio = parentSize.x < parentSize.y ? new vec2(1, parentSize.x / parentSize.y) : new vec2(parentSize.y / parentSize.x, 1)

            current.buttonObject.Object.layer = layer;
            current.buttonObject.Object.enabled = btn.enabled;
            current.buttonObject.ScreenTransform.anchors.setSize(
                btn.scale.mult(new vec2(1, aspect)).uniformScale(2) // * 2 signed normalized size
            );

            current.buttonObject.ScreenTransform.anchors.setCenter(
                btn.position.mult(new vec2(1, aspect)).uniformScale(8) // * 2 signed normalized size * 4 Material plane
            );

            current.buttonObject.Image.stretchMode = StretchMode.Stretch;
            current.buttonObject.Image.setRenderOrder(renderOrder);
            current.buttonObject.Image.mainMaterial = material.clone();
            current.buttonObject.Image.mainMaterial.mainPass._textFixScale_ = btn.scale;
            current.buttonObject.Image.mainMaterial.mainPass.debugIndex = index - 1;

            if(btn.id.includes("_buttonBase")) current.buttonObject.Image.mainMaterial.mainPass.isDebug = false;

            current.buttonObject.InteractionComponent.isFilteredByDepth = false;
            current.buttonObject.InteractionComponent.onTouchStart.add(
                () => {
                    touchStartCallback();
                    current.buttonObject.Image.mainMaterial.mainPass.debugHit = true;
                }
            );
            current.buttonObject.InteractionComponent.onTouchEnd.add(
                () => {
                    touchEndCallback();
                    current.buttonObject.Image.mainMaterial.mainPass.debugHit = false;
                }
            );

            this.buttonObjects[btn.id] = current;
            (this.buttonGroups[btn.groupId] ??= []).push(btn.id);
            index++;
        }
    }

    public getButtonObject(id: string): BatchSceneObject{
        return this.buttonObjects[id].buttonObject;
    }

    public getButtonGroups(groupId: string): Array<BatchSceneObject> {
        return this.buttonGroups[groupId].map(x => this.buttonObjects[x].buttonObject);
    }

    public setSafeAreaFix(script: BaseScriptComponent){
        const screenRegionObject = this.getScreenRegionParent(this.sceneObject);
        const isSafeRegion = screenRegionObject.getComponent("Component.ScreenRegionComponent").region === ScreenRegionType.SafeRender;

        if(!isSafeRegion) return;

        // WARNING: Delay is not desired, but render region modifications is not onAwake, probably, idk it works so
        QuickUtils.delayedCall(.01, script, ()=>{
            const top = screenRegionObject.getComponent("Component.ScreenTransform").localPointToScreenPoint(new vec2(0,1)).y;
            const bottom = screenRegionObject.getComponent("Component.ScreenTransform").localPointToScreenPoint(new vec2(0,-1)).y;
            const fixRatio = Math.abs(top - bottom);

            for(const btn of this.buttonMapData) {
                const size = this.buttonObjects[btn.id].buttonObject.ScreenTransform.anchors.getSize();
                const center = this.buttonObjects[btn.id].buttonObject.ScreenTransform.anchors.getCenter();
                //We assume screen is always vertical
                this.buttonObjects[btn.id].buttonObject.ScreenTransform.anchors.setSize(
                    size.mult(new vec2(1, 1/fixRatio))
                );
                this.buttonObjects[btn.id].buttonObject.ScreenTransform.anchors.setCenter(
                    center.mult(new vec2(1, 1/fixRatio))
                );
            }
        })
    }

    private getScreenRegionParent(obj: SceneObject) {
        if (obj.getComponent("Component.ScreenRegionComponent")) {
            return obj;
        } else if (obj.getParent()) {
            return this.getScreenRegionParent(obj.getParent());
        } else {
            return null;
        }
    }
}

export class LiqmoGlass {
    public bindScreenToInteraction: boolean = false;
    public touchEnabled: boolean = false;
    public screenTouchCanceled: boolean = false;
    public initPosition: vec2;
    public currentPosition: vec2;

    private lastStates: MaterialTouchSetup = new MaterialTouchSetup();
    private damper: Damper;

    constructor(
        readonly button: BaseScriptComponent, /// ??? whole component
        readonly material: Material,
        readonly dampSpeed: number,
        readonly glassSettings: GlassSettings = new GlassSettings(),
        readonly touchSettings: TouchSettings = new TouchSettings(),
        readonly shapeSettings: ShapeSettings = new ShapeSettings(),
        public iconSettings: IconSettings = new IconSettings(),
        readonly materialIcon?: Material
    ) {
        this.damper = new Damper(button);
        this.damper.dampStrength = dampSpeed;

        for (const prop in glassSettings) {
            material.mainPass[prop] = glassSettings[prop];
            if(materialIcon) materialIcon.mainPass[prop] = glassSettings[prop];
        }

        for (const prop in shapeSettings) {
            material.mainPass[prop] = shapeSettings[prop];
            if(materialIcon) materialIcon.mainPass[prop] = shapeSettings[prop];
        }

        for (const prop in touchSettings) {
            material.mainPass[prop] = touchSettings[prop];
            if(materialIcon) materialIcon.mainPass[prop] = touchSettings[prop];
        }

        for (const prop in iconSettings) {
            material.mainPass[prop] = iconSettings[prop];
        }

        button
            .createEvent("TouchStartEvent")
            .bind(this.screenTouchStart.bind(this));
        button
            .createEvent("TouchMoveEvent")
            .bind(this.screenTouchMove.bind(this));
        button
            .createEvent("TouchEndEvent")
            .bind(this.screenTouchEnd.bind(this));
    }

    private screenTouchStart(e: TouchStartEvent) {
        if (!this.touchEnabled) return;

        this.initPosition = e.getTouchPosition();

        this.lastStates.p0 = this.initPosition;
        this.material.mainPass.p0 = this.initPosition;
        this.material.mainPass.p1 = this.initPosition;
        this.material.mainPass.touchInput = this.initPosition;

        const pressureOn = this.damper.addValue(0, (v) => {
            this.material.mainPass.pressure = v;
            this.lastStates.pressure = v;
        });
        this.damper.setTarget(pressureOn, 0.7);
    }

    private screenTouchMove(e: TouchMoveEvent) {
        if (this.screenTouchCanceled && this.bindScreenToInteraction)
            this.screenTouchEnd();
        if (!this.touchEnabled) return;

        this.currentPosition = e.getTouchPosition();

        this.lastStates.p1 = this.currentPosition;

        this.material.mainPass.touchInput = this.currentPosition;
        this.material.mainPass.p1 = this.currentPosition;
    }

    private screenTouchEnd(e?: TouchEndEvent) {
        if (!this.screenTouchCanceled && this.bindScreenToInteraction) return;
        if (!this.touchEnabled && !this.bindScreenToInteraction) return;

        if (e) this.currentPosition = e.getTouchPosition();
        this.touchEnabled = false;
        this.screenTouchCanceled = false;

        const pressureOff = this.damper.addValue(
            this.lastStates.pressure,
            (v) => (this.material.mainPass.pressure = v)
        );
        this.damper.setTarget(pressureOff, 0);
    }
}

export class IconSettingsPlus extends IconSettings {
    icon0?: Texture;
    icon1?: Texture;
}

export type ParentInteractionPositions = {
    id: string,
    position: vec2
}

export type ParentSnatch = {
    shapeSettings: ShapeSettings | MorphShapeSettings,
    iconSettings: IconSettingsPlus,
    interactionPositions: Array<ParentInteractionPositions>,
    userButtonFunctions: Record<string, UserBtnEventMap>,
};

@component
export abstract class LiqmoGlassBase extends BaseScriptComponent {
    @input("int")
    renderOrder: number;

    @input
    dampSpeed: number = 10;

    @input
    bindTouchToInteraction: boolean;

    @ui.separator
    @input
    glassSettings: GlassSettings;

    @ui.separator
    @input
    touchSettings: TouchSettings;

    @ui.separator
    @input
    interactions: InteractionsInput;

    protected iconSettings: IconSettings;
    protected shapeSettings: ShapeSettings | MorphShapeSettings;
    protected material: Material;
    protected debugMaterial: Material;

    protected buttonFuncDefinitions: Record<string, UserBtnEventMap> = {};
    protected BID: ButtonDefinitions;
    protected LG: LiqmoGlass;
    protected damper = new Damper(this);

    protected lastlocalPosition: vec2;
    
    get isButtonTouch(){
        return this.LG.touchEnabled;
    }

    get customButtonFunctions() {
        return this.buttonFuncDefinitions;
    }

    get customInteractions(){
        const arr = [];
        for (const item of this.interactions.addInteraction) {
            if (item.id && item.id !== "_buttonBase") {
                arr.push(item);
            }
        }
        return arr;
    }

    set userButtonFunctions(_) {
        throw new Error(
            "Cannot reassign.\nYou may add methods to your buttons via userButtonFunctions.buttonId"
        );
    }

    //Duzeltme!!! boku cikti
    public _initiateThumb(invisibleTex: Texture, iconSetToSelection: string = "icon0") {
        const iconSettings = this.iconSettings;
        const shapeSettings = this.shapeSettings;
        const interactionPositions: Array<ParentInteractionPositions> = this.interactions.addInteraction.reduce(
            (acc, curr, i) => {
                if(curr.id !== "_buttonBase") acc.push({id: curr.id, position: curr.position});
                return acc;
            },[]
        );

        //Pass and override user functions
        if(!this.interactions.debugOnScreen) {
            var userButtonFunctions = this.buttonFuncDefinitions;
            this.interactions.addInteraction.forEach(x => {
                if(!x.id.includes("_buttonBase")) this.modifyInteraction(x.id, false);
            });
        } else {
            console.warn("Screen debugging is on! Selector buttond may not work properly in this mode.");
        };

        //Override icon
        this.modifyIconSet({
            [iconSetToSelection]: invisibleTex,
            useColor: false,
        });

        return {
            shapeSettings: shapeSettings,
            iconSettings: iconSettings,
            interactionPositions: interactionPositions,
            userButtonFunctions: userButtonFunctions,
        } as ParentSnatch;
    }

    public modifyInteraction(buttonId: string, visible: boolean = true) {
        const t = this.BID.getButtonObject(buttonId).Object;
        t.enabled = visible;
    }

    public modifyInteractionGroup(groupId: string, visible: boolean = true) {
        const t = this.BID.getButtonGroups(groupId);
        t.forEach((x) => (x.Object.enabled = visible));
    }

    public modifyShape(shapeSettings: Partial<ShapeSettings | MorphShapeSettings>) {
        for (const prop in shapeSettings) {
            const dampEntry = this.damper.addValue(
                this.shapeSettings[prop], 
                (v) => {this.material.mainPass[prop] = v;},
            );
            this.damper.setTarget(dampEntry, shapeSettings[prop]);
        }
    }

    public modifyIconSet(iconSettings: Partial<IconSettingsPlus>) {
        for (const prop in iconSettings) {
            if(isNumericLike(prop)){
                const dampEntry = this.damper.addValue(
                    this.iconSettings[prop], 
                    (v) => {this.material.mainPass[prop] = v;},
                );
                this.damper.setTarget(dampEntry, iconSettings[prop]);
            } else {
                this.material.mainPass[prop] = iconSettings[prop];
            }
        }
    }

    public modifyGlass(glassSettings: Partial<GlassSettings>) {
        for (const prop in glassSettings) {
            if(isNumericLike(prop)){
                const dampEntry = this.damper.addValue(
                    this.glassSettings[prop], 
                    (v) => {this.material.mainPass[prop] = v;},
                );
                this.damper.setTarget(dampEntry, glassSettings[prop]);
            } else {
                this.material.mainPass[prop] = glassSettings[prop];
            }
        }
    }

    public modifyTouch(touchSettings: Partial<TouchSettings>) {
        for (const prop in touchSettings) {
            const dampEntry = this.damper.addValue(
                this.touchSettings[prop], 
                (v) => {this.material.mainPass[prop] = v;},
            );
            this.damper.setTarget(dampEntry, touchSettings[prop]);
        }
    }

    //Reset
    public resetShape() {
        for (const prop in this.shapeSettings) {
            const dampEntry = this.damper.addValue(
                this.material.mainPass[prop], 
                (v) => {this.material.mainPass[prop] = v;},
            );
            this.damper.setTarget(dampEntry, this.shapeSettings[prop]);
        }
    }

    public resetIconSet() {
        for (const prop in this.iconSettings) {
            if(isNumericLike(prop)){
                const dampEntry = this.damper.addValue(
                    this.material.mainPass[prop], 
                    (v) => {this.material.mainPass[prop] = v;},
                );
                this.damper.setTarget(dampEntry, this.iconSettings[prop]);
            } else {
                this.material.mainPass[prop] = this.iconSettings[prop];
            }
        }
    }

    public resetGlass() {
        for (const prop in this.glassSettings) {
            if(isNumericLike(prop)){
                const dampEntry = this.damper.addValue(
                    this.material.mainPass[prop], 
                    (v) => {this.material.mainPass[prop] = v;},
                );
                this.damper.setTarget(dampEntry, this.glassSettings[prop]);
            } else {
                this.material.mainPass[prop] = this.glassSettings[prop];
            }
        }
    }

    public resetTouch() {
        for (const prop in this.touchSettings) {
            const dampEntry = this.damper.addValue(
                this.material.mainPass[prop], 
                (v) => {this.material.mainPass[prop] = v;},
            );
            this.damper.setTarget(dampEntry, this.touchSettings[prop]);
        }
    }
}
