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
// @input Asset.Texture[] elevationTextures {"hint":"Elevation render textures — one per house, same order as HouseData.ts"}
// @input Asset.Texture[] floorPlanTextures {"hint":"Floor plan textures — one per house, same order as HouseData.ts"}
// @input SceneObject cardStripRoot {"hint":"The card strip root SceneObject (Frame)"}
// @input SceneObject floorPlanDisplay {"hint":"The floor plan display SceneObject (starts disabled)"}
// @input Component.RenderMeshVisual floorPlanMesh {"hint":"The RenderMeshVisual on the floor plan quad"}
// @input Component.Text floorPlanTitle {"hint":"Text component showing the selected house name"}
// @input Component.Text floorPlanDetails {"hint":"Text component showing house details (sqft, beds, baths)"}
// @input Component.Text floorPlanCounter {"hint":"Text component showing \"X of Y\" counter"}
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../Modules/Src/Assets/Scripts/CatalogManager");
Object.setPrototypeOf(script, Module.CatalogManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("elevationTextures", []);
    checkUndefined("floorPlanTextures", []);
    checkUndefined("cardStripRoot", []);
    checkUndefined("floorPlanDisplay", []);
    checkUndefined("floorPlanMesh", []);
    checkUndefined("floorPlanTitle", []);
    checkUndefined("floorPlanDetails", []);
    checkUndefined("floorPlanCounter", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
