import {
    LiqmoGlass,
    MorphShapeSettings,
    IconSettings,
    ButtonDefinitions,
    LiqmoGlassBase,
} from "./LiqmoGlass";
import { BatchUtils } from "./HelpersForLS";

@component
export class LiqmoMorphButton extends LiqmoGlassBase {
    @ui.separator
    @input
    shapeSettings: MorphShapeSettings;

    @ui.separator
    @ui.group_start("Icon Setup")
    @input
    @label("Icon Set")
    @allowUndefined
    icon0: Texture;
    @input
    @label("Child Icon Set")
    @allowUndefined
    icon1: Texture;
    @input
    iconSettings: IconSettings;
    @ui.group_end

    @input
    material: Material;

    @input
    debugMaterial: Material;

    onAwake() {
        global.touchSystem.touchBlocking = true;

        //@ts-ignore - because of some ls decorator bullshit
        this.iconSettings.icon0 = this.icon0;
        //@ts-ignore
        this.iconSettings.icon1 = this.icon1;

        //Add base interaction for the selection thing
        this.interactions.addInteraction.unshift({
            id: "_buttonBase",
            groupId: "_buttonBase",
            position: this.shapeSettings.shapePosition,
            scale: this.shapeSettings.shapeScale,
            enabled: true,
        });

        this.material = this.material.clone();
        this.debugMaterial.mainPass.isDebug = this.interactions.debugOnScreen;
        this.damper.dampStrength = this.dampSpeed;

        const mainButton = BatchUtils.createBatchSceneObject(
            this.sceneObject,
            "_button",
            ["Image"],
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
            this.interactions.addInteraction,
            this.debugMaterial,
            this.sceneObject.layer,
            this.renderOrder + 1,
            () => (this.LG.touchEnabled = true),
            () => {
                if(this.bindTouchToInteraction){
                    this.LG.touchEnabled = false;
                    this.LG.screenTouchCanceled = true;
                }
            }
        );
        this.BID.setSafeAreaFix(this);
        
        this.buttonFuncDefinitions = this.BID.buttonObjects;
    }
}
