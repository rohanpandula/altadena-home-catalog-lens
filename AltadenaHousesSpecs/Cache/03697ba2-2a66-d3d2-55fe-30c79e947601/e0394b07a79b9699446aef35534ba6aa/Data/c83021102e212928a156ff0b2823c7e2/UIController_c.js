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
// @input SceneObject[] sceneObjects
// @input Component.Text textObject
// @input Component.Text counterText
// @input AssignableType nextButton
// @input AssignableType_1 previousButton
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../../../Modules/Src/Packages/SpectaclesInteractionKitExamples.lspkg/Examples/UIStarter/Scripts/UIController");
Object.setPrototypeOf(script, Module.UIController.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("sceneObjects", []);
    checkUndefined("textObject", []);
    checkUndefined("counterText", []);
    checkUndefined("nextButton", []);
    checkUndefined("previousButton", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
