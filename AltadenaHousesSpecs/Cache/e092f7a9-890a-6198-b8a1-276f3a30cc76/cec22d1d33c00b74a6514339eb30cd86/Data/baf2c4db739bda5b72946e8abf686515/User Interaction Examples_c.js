if (script.onAwake) {
    script.onAwake();
    return;
}
function checkUndefined(property, showIfData) {
    for (var i = 0; i < showIfData.length; i++) {
        if (showIfData[i][0] && script[showIfData[i][0]] != showIfData[i][1]) {
            return;
        }
    }
    if (script[property] == undefined) {
        throw new Error("Input " + property + " was not provided for the object " + script.getSceneObject().name);
    }
}
// @ui {"widget":"group_start", "label":"Basic Button"}
// @input Component.ScriptComponent BasicButton
// @input Asset.Texture viewPacked
// @ui {"widget":"group_end"}
// @ui {"widget":"group_start", "label":"Expandable Basic Button"}
// @input Component.ScriptComponent BasicButtonExpandable
// @input Asset.Texture menuSet
// @input Asset.Texture menu
// @ui {"widget":"group_end"}
// @ui {"widget":"group_start", "label":"Popup Menu Button"}
// @input Component.ScriptComponent PopupMenu
// @input Asset.Texture viewOn
// @input Asset.Texture viewOff
// @input Asset.Texture menuDouble
// @ui {"widget":"group_end"}
// @ui {"widget":"group_start", "label":"Menus with Selection Highlight"}
// @input Component.ScriptComponent VerticalMenuWithSelector
// @input Component.ScriptComponent HorizontalMenuWithSelector
// @ui {"widget":"group_end"}
// @ui {"widget":"group_start", "label":"Other Buttons with Selection Highlight"}
// @input Component.ScriptComponent Slider
// @input Component.ScriptComponent Switch
// @ui {"widget":"group_end"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../Modules/Src/Assets/Liquid Glass UI Pack.lspkg/Examples/User Interaction Examples");
Object.setPrototypeOf(script, Module.UserInteractionExamples.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("BasicButton", []);
    checkUndefined("viewPacked", []);
    checkUndefined("BasicButtonExpandable", []);
    checkUndefined("menuSet", []);
    checkUndefined("menu", []);
    checkUndefined("PopupMenu", []);
    checkUndefined("viewOn", []);
    checkUndefined("viewOff", []);
    checkUndefined("menuDouble", []);
    checkUndefined("VerticalMenuWithSelector", []);
    checkUndefined("HorizontalMenuWithSelector", []);
    checkUndefined("Slider", []);
    checkUndefined("Switch", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
