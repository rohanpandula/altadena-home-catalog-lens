"use strict";
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserInteractionExamples = void 0;
var __selfType = requireType("./User Interaction Examples");
function component(target) {
    target.getTypeName = function () { return __selfType; };
    if (target.prototype.hasOwnProperty("getTypeName"))
        return;
    Object.defineProperty(target.prototype, "getTypeName", {
        value: function () { return __selfType; },
        configurable: true,
        writable: true
    });
}
let UserInteractionExamples = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var UserInteractionExamples = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.BasicButton = this.BasicButton;
            this.viewPacked = this.viewPacked;
            this.BasicButtonExpandable = this.BasicButtonExpandable;
            this.menuSet = this.menuSet;
            this.menu = this.menu;
            this.PopupMenu = this.PopupMenu;
            this.viewOn = this.viewOn;
            this.viewOff = this.viewOff;
            this.menuDouble = this.menuDouble;
            this.VerticalMenuWithSelector = this.VerticalMenuWithSelector;
            this.HorizontalMenuWithSelector = this.HorizontalMenuWithSelector;
            this.Slider = this.Slider;
            this.Switch = this.Switch;
        }
        __initialize() {
            super.__initialize();
            this.BasicButton = this.BasicButton;
            this.viewPacked = this.viewPacked;
            this.BasicButtonExpandable = this.BasicButtonExpandable;
            this.menuSet = this.menuSet;
            this.menu = this.menu;
            this.PopupMenu = this.PopupMenu;
            this.viewOn = this.viewOn;
            this.viewOff = this.viewOff;
            this.menuDouble = this.menuDouble;
            this.VerticalMenuWithSelector = this.VerticalMenuWithSelector;
            this.HorizontalMenuWithSelector = this.HorizontalMenuWithSelector;
            this.Slider = this.Slider;
            this.Switch = this.Switch;
        }
        onAwake() {
            if (this.BasicButton.getSceneObject().enabled)
                this.BasicButtonExample();
            if (this.BasicButtonExpandable.getSceneObject().enabled)
                this.ExpandableButtonExample();
            if (this.PopupMenu.getSceneObject().enabled)
                this.PopupMenuExample();
            if (this.VerticalMenuWithSelector.getSceneObject().enabled)
                this.VerticalMenuExample();
            if (this.HorizontalMenuWithSelector.getSceneObject().enabled)
                this.HorizontalMenuExample();
            if (this.Slider.getSceneObject().enabled)
                this.SliderExample();
            if (this.Switch.getSceneObject().enabled)
                this.SwitchExample();
        }
        // SEE THE USAGE HERE
        BasicButtonExample() {
            //Use button state
            let buttonState = "On";
            //'customButtonFunctions' contains button interactions that we mapped in the component ui
            //For basic button there is only "mainButton" interaction we set in 'customButtonFunctions'
            this.BasicButton.customButtonFunctions.mainButton.add(() => {
                if (buttonState === "On") {
                    buttonState = "Off";
                    print("Icon state is 'hidden'");
                    //You may modify icon properties in runtime
                    //Modifying 'colorChannel' to select another icon in packed texture
                    this.BasicButton.modifyIconSet({
                        colorChannel: 1,
                    });
                }
                else {
                    buttonState = "On";
                    print("Icon state is 'show'");
                    this.BasicButton.modifyIconSet({
                        colorChannel: 0,
                    });
                }
            });
            //You may add multiple button events
            this.BasicButton.customButtonFunctions.mainButton.add(
            //You may pass an argument to get 'usual LS touch properties'
            (touch) => {
                print(`Separate touch event with touch position: ${touch.position}`);
            });
        }
        ExpandableButtonExample() {
            this.BasicButtonExpandable.customButtonFunctions.Open.add(() => {
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
            this.BasicButtonExpandable.customButtonFunctions.Close.add(() => {
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
            this.BasicButtonExpandable.customButtonFunctions.Choice1.add(() => print("Choice1 pressed"));
            this.BasicButtonExpandable.customButtonFunctions.Choice2.add(() => print("Choice2 pressed"));
            this.BasicButtonExpandable.customButtonFunctions.Choice3.add(() => print("Choice3 pressed"));
        }
        PopupMenuExample() {
            //This part is pretty much the same
            this.PopupMenu.customButtonFunctions.ToggleOn.add(() => {
                this.PopupMenu.modifyShape({
                    shapePosition: new vec2(-0.13, 0),
                    childOffset: new vec2(0.23, 0),
                    childScale: new vec2(2, 1),
                    childRadius: new vec4(1, 1, 1, 1),
                });
                this.PopupMenu.modifyIconSet({
                    icon0: this.viewOff,
                    icon1: this.menuDouble,
                });
                this.PopupMenu.modifyInteraction("ToggleOn", false);
                this.PopupMenu.modifyInteractionGroup("Menu", true);
            });
            this.PopupMenu.customButtonFunctions.ToggleOff.add(() => {
                this.PopupMenu.resetShape();
                this.PopupMenu.resetIconSet();
                this.PopupMenu.modifyInteraction("ToggleOn", true);
                this.PopupMenu.modifyInteractionGroup("Menu", false);
            });
            this.PopupMenu.customButtonFunctions.Choice1.add(() => { print("Choice1 pressed"); });
            this.PopupMenu.customButtonFunctions.Choice2.add(() => { print("Choice2 pressed"); });
            // Since all "customButtonFunctions" bind to "onTouchEnd" in Liqmo Glass Components,
            // we can close the menu when tap outside with "TouchStartEvent"
            this.createEvent("TouchStartEvent").bind(() => {
                // Checking if current screen touch is on button itself
                if (this.PopupMenu.isButtonTouch)
                    return;
                //If we're outside of the button basically reset to initial state
                this.PopupMenu.resetShape();
                this.PopupMenu.resetIconSet();
                this.PopupMenu.modifyInteraction("ToggleOn", true);
                this.PopupMenu.modifyInteractionGroup("Menu", false);
            });
        }
        VerticalMenuExample() {
            //Another way to target interactions
            for (const item of this.VerticalMenuWithSelector.customInteractions) {
                this.VerticalMenuWithSelector.customButtonFunctions[item.id].add(
                //Buttons with Selector Component gets extra properties in their touch argument
                (touch) => {
                    print(`${item.id} selected on ${touch.snappedPosInRect}`); //In rect/local snapped position after touch 
                });
            }
        }
        HorizontalMenuExample() {
            for (const item of this.HorizontalMenuWithSelector.customInteractions) {
                this.HorizontalMenuWithSelector.customButtonFunctions[item.id].add((touch) => {
                    print(`${item.id} selected on ${touch.snappedPosInRect}`);
                });
            }
        }
        SliderExample() {
            //Slider has some specific need...
            //Since button interaction area determined by it interactions position
            //  -it controls the min and max area of the button
            //We give 'startPoint' and 'endPoint' intreactions to determine slider boundary
            //  -we may add functionality to these points as well
            //However, slider is for where we don't need increment on our values
            //so we give another interaction for touch event
            //to benefit from this 'interactionArea' we set 'buttonType' of selector to 'Slider'
            this.Slider.customButtonFunctions.interactionArea.add((touch) => {
                // Since we need precise position for slider, we don't use 'snappedPosInRect'
                print(`Slider touch position in rect: ${touch.positionInRect}`);
            });
        }
        SwitchExample() {
            //Altough 'Switch' doesn't have specific need we set 'buttonType' to 'Switch'
            //to get swith behaviour -when clicked same point it still switches between two states
            this.Switch.customButtonFunctions.StateOn.add(() => {
                print("Switch state is ON");
            });
            this.Switch.customButtonFunctions.StateOff.add(() => {
                print("Switch state is OFF");
            });
        }
    };
    __setFunctionName(_classThis, "UserInteractionExamples");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        UserInteractionExamples = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return UserInteractionExamples = _classThis;
})();
exports.UserInteractionExamples = UserInteractionExamples;
//# sourceMappingURL=User%20Interaction%20Examples.js.map