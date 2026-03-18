//Importing classes from components for better completions
import { LiqmoBasicButton } from "../Liqmo Basic Button.lsc/Liqmo Basic Button"
import { LiqmoMorphButton } from "../Liqmo Morph Button.lsc/Liqmo Morph Button"

@component
export class UserInteractionExamples extends BaseScriptComponent {
    @ui.group_start("Basic Button")
    @input("Component.ScriptComponent")
    BasicButton: LiqmoBasicButton

    @input
    viewPacked: Texture
    @ui.group_end

    @ui.group_start("Expandable Basic Button")
    @input("Component.ScriptComponent")
    BasicButtonExpandable: LiqmoBasicButton
    
    @input
    menuSet: Texture

    @input
    menu: Texture
    @ui.group_end

    @ui.group_start("Popup Menu Button")
    @input("Component.ScriptComponent")
    PopupMenu: LiqmoMorphButton

    @input
    viewOn: Texture

    @input
    viewOff: Texture

    @input
    menuDouble: Texture

    @ui.group_end

    @ui.group_start("Menus with Selection Highlight")
    @input("Component.ScriptComponent")
    VerticalMenuWithSelector: LiqmoBasicButton

    @input("Component.ScriptComponent")
    HorizontalMenuWithSelector: LiqmoBasicButton
    @ui.group_end

    @ui.group_start("Other Buttons with Selection Highlight")
    @input("Component.ScriptComponent")
    Slider: LiqmoBasicButton

    @input("Component.ScriptComponent")
    Switch: LiqmoBasicButton
    @ui.group_end

    onAwake() {
        if(this.BasicButton.getSceneObject().enabled) this.BasicButtonExample();
        if(this.BasicButtonExpandable.getSceneObject().enabled) this.ExpandableButtonExample();
        if(this.PopupMenu.getSceneObject().enabled) this.PopupMenuExample();
        if(this.VerticalMenuWithSelector.getSceneObject().enabled) this.VerticalMenuExample();
        if(this.HorizontalMenuWithSelector.getSceneObject().enabled) this.HorizontalMenuExample();
        if(this.Slider.getSceneObject().enabled) this.SliderExample();
        if(this.Switch.getSceneObject().enabled) this.SwitchExample();
    }

    // SEE THE USAGE HERE
    BasicButtonExample(){
        //Use button state
        let buttonState = "On";
        
        //'customButtonFunctions' contains button interactions that we mapped in the component ui
        //For basic button there is only "mainButton" interaction we set in 'customButtonFunctions'
        this.BasicButton.customButtonFunctions.mainButton.add(()=>{
            if(buttonState === "On"){
                buttonState = "Off";
                print("Icon state is 'hidden'");

                //You may modify icon properties in runtime
                //Modifying 'colorChannel' to select another icon in packed texture
                this.BasicButton.modifyIconSet({
                    colorChannel: 1,
                })
            } else {  
                buttonState = "On";
                print("Icon state is 'show'");

                this.BasicButton.modifyIconSet({
                    colorChannel: 0,
                })
            }
        });

        //You may add multiple button events
        this.BasicButton.customButtonFunctions.mainButton.add(
            //You may pass an argument to get 'usual LS touch properties'
            (touch)=> {
                print(`Separate touch event with touch position: ${touch.position}`)
            }
        );
    }

    ExpandableButtonExample(){
        this.BasicButtonExpandable.customButtonFunctions.Open.add(()=>{
            //Modifying 'icon0' property to update icon and adding some scale
            this.BasicButtonExpandable.modifyIconSet({
                icon0: this.menuSet,
                iconScale: 1.3,
            });

            //You may modify shape properties too
            this.BasicButtonExpandable.modifyShape({
                shapeScale: new vec2(1, 1),
                cornerRadius: vec4.one().uniformScale(0.25),
            });

            //Also interaction visibilty can be modified individually or via groups
            this.BasicButtonExpandable.modifyInteraction("Open", false);
            this.BasicButtonExpandable.modifyInteractionGroup("Menu", true); 
        });

        // Adding functionality to close button
        this.BasicButtonExpandable.customButtonFunctions.Close.add(()=>{
            this.BasicButtonExpandable.modifyIconSet({
                icon0: this.menu,
                iconScale: 4,
            });

            //You may re-modify or reset shown in example
            this.BasicButtonExpandable.resetShape();

            this.BasicButtonExpandable.modifyInteraction("Open", true);
            this.BasicButtonExpandable.modifyInteractionGroup("Menu", false);
        });

        // Adding functionality to menu buttons
        this.BasicButtonExpandable.customButtonFunctions.Choice1.add(()=>print("Choice1 pressed"));
        this.BasicButtonExpandable.customButtonFunctions.Choice2.add(()=>print("Choice2 pressed"));
        this.BasicButtonExpandable.customButtonFunctions.Choice3.add(()=>print("Choice3 pressed"));
    }

    PopupMenuExample(){
        //This part is pretty much the same
        this.PopupMenu.customButtonFunctions.ToggleOn.add(()=>{
            this.PopupMenu.modifyShape({
                shapePosition: new vec2(-0.13, 0),
                childOffset: new vec2(0.23, 0),
                childScale: new vec2(2,1),
                childRadius: new vec4(1, 1, 1, 1),
            })

            this.PopupMenu.modifyIconSet({
                icon0: this.viewOff,
                icon1: this.menuDouble,
            })

            this.PopupMenu.modifyInteraction("ToggleOn", false);
            this.PopupMenu.modifyInteractionGroup("Menu", true);
        })

        this.PopupMenu.customButtonFunctions.ToggleOff.add(()=>{
            this.PopupMenu.resetShape();
            this.PopupMenu.resetIconSet();

            this.PopupMenu.modifyInteraction("ToggleOn", true);
            this.PopupMenu.modifyInteractionGroup("Menu", false);
        })

        this.PopupMenu.customButtonFunctions.Choice1.add(()=>{print("Choice1 pressed")});
        this.PopupMenu.customButtonFunctions.Choice2.add(()=>{print("Choice2 pressed")});

        // Since all "customButtonFunctions" bind to "onTouchEnd" in Liqmo Glass Components,
        // we can close the menu when tap outside with "TouchStartEvent"
        this.createEvent("TouchStartEvent").bind(()=>{
            // Checking if current screen touch is on button itself
            if(this.PopupMenu.isButtonTouch) return;

            //If we're outside of the button basically reset to initial state
            this.PopupMenu.resetShape();
            this.PopupMenu.resetIconSet();

            this.PopupMenu.modifyInteraction("ToggleOn", true);
            this.PopupMenu.modifyInteractionGroup("Menu", false);
        })
    }

    VerticalMenuExample(){
        //Another way to target interactions
        for(const item of this.VerticalMenuWithSelector.customInteractions){
            this.VerticalMenuWithSelector.customButtonFunctions[item.id].add(
                //Buttons with Selector Component gets extra properties in their touch argument
                (touch)=>{
                    print(`${item.id} selected on ${touch.snappedPosInRect}`)  //In rect/local snapped position after touch 
                }
            )
        }
    }

    HorizontalMenuExample(){
        for(const item of this.HorizontalMenuWithSelector.customInteractions){
            this.HorizontalMenuWithSelector.customButtonFunctions[item.id].add(
                (touch)=>{
                    print(`${item.id} selected on ${touch.snappedPosInRect}`)
                }
            )
        }
    }

    SliderExample(){
        //Slider has some specific need...
        //Since button interaction area determined by it interactions position
        //  -it controls the min and max area of the button

        //We give 'startPoint' and 'endPoint' intreactions to determine slider boundary
        //  -we may add functionality to these points as well

        //However, slider is for where we don't need increment on our values
        //so we give another interaction for touch event
        //to benefit from this 'interactionArea' we set 'buttonType' of selector to 'Slider'
        this.Slider.customButtonFunctions.interactionArea.add(
            (touch) => {
                // Since we need precise position for slider, we don't use 'snappedPosInRect'
                print(`Slider touch position in rect: ${touch.positionInRect}`)
            }
        )
    }

    SwitchExample(){
        //Altough 'Switch' doesn't have specific need we set 'buttonType' to 'Switch'
        //to get swith behaviour -when clicked same point it still switches between two states
        this.Switch.customButtonFunctions.StateOn.add(
            () => {
                print("Switch state is ON")
            }
        )
        
        this.Switch.customButtonFunctions.StateOff.add(
            () => {
                print("Switch state is OFF")
            }
        )
    }
}
