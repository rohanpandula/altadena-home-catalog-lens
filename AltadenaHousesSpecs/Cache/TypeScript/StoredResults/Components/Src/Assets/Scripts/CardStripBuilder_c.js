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
// @input Asset.Material cardMaterial {"hint":"Unlit material to clone for card images"}
// @input Asset.RenderMesh cardMesh {"hint":"Plane mesh for card images"}
// @input SceneObject cameraObject {"hint":"Camera SceneObject for raycasting"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../Modules/Src/Assets/Scripts/CardStripBuilder");
Object.setPrototypeOf(script, Module.CardStripBuilder.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("catalogManager", []);
    checkUndefined("cardMaterial", []);
    checkUndefined("cardMesh", []);
    checkUndefined("cameraObject", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
