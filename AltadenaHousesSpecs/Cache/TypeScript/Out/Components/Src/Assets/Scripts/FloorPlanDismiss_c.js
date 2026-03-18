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
// @input Component.ScriptComponent catalogManager {"hint":"The CatalogManager script component"}
// @input SceneObject prevButton {"hint":"SceneObject for the Prev button text"}
// @input SceneObject nextButton {"hint":"SceneObject for the Next button text"}
// @input SceneObject backButton {"hint":"SceneObject for the Back button text"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../Modules/Src/Assets/Scripts/FloorPlanDismiss");
Object.setPrototypeOf(script, Module.FloorPlanDismiss.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("catalogManager", []);
    checkUndefined("prevButton", []);
    checkUndefined("nextButton", []);
    checkUndefined("backButton", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
