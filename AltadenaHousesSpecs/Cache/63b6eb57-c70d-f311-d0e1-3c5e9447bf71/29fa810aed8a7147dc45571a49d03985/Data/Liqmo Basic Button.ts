import {
    LiqmoGlassBase,
    LiqmoGlass,
    ShapeSettings,
    IconSettings,
    ButtonDefinitions,
} from "./LiqmoGlass";
import { BatchUtils } from "./HelpersForLS";

@component
export class LiqmoBasicButton extends LiqmoGlassBase {
    @ui.separator
    @input
    shapeSettings: ShapeSettings;

    @ui.separator
    @ui.group_start("Icon Setup")
    @input
    @label("Icon Set")
    icon0: Texture;
    @input
    iconSettings: IconSettings;
    @ui.group_end
    @ui.separator

    @input
    material: Material;

    @input
    debugMaterial: Material;

    onAwake() {
        global.touchSystem.touchBlocking = true;

        //@ts-ignore - because of some ls decorator bullshit
        this.iconSettings.icon0 = this.icon0;

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
                if (this.bindTouchToInteraction) {
                    this.LG.touchEnabled = false;
                    this.LG.screenTouchCanceled = true;
                }
            }
        );
        this.BID.setSafeAreaFix(this);
        
        this.buttonFuncDefinitions = this.BID.buttonObjects;
    }
};