if (script.onAwake) {
    script.onAwake();
    return;
}
/*
@typedef GlassSettings
@property {float} thickness = 2
@property {float} frost = 1
@property {float} transparency {"widget":"slider", "min":0, "max":1, "step":0.01}
@property {float} material = 0.7 {"widget":"slider", "min":0, "max":1, "step":0.01}
@property {bool} useTex {"label":"Use Texture"}
@property {vec4} baseColor = {0,0,0,1} {"label":"Color Tint", "widget":"color", "showIf":"useTex", "showIfValue":false}
@property {Asset.Texture} extraTex {"label":"Texture", "showIf":"useTex"}
@ui {"widget":"label", "label":""}
@property {bool} topLighting {"label":"Flat Lighting"}
@property {float} lightAngle = 1 {"widget":"slider", "min":0, "max":360, "step":1}
@property {float} bleed = 10 {"label":"Light Bleed"}
@ui {"widget":"label", "label":""}
@property {float} chromaticAbbr = 1 {"label":"⚠️ Chromatic Aberration", "hint":"Higher values may impact performance"}
@property {bool} chromaticAbbrOnSurface {"label":"⚠️ On Surface", "hint":"May impact performance"}
@ui {"widget":"label", "label":""}
@property {int} quality = 20 {"label":"⚠️ Render Quality", "hint":"Higher values will impact performance"}
*/
/*
@typedef TouchSettings
@property {float} stretchStrength = 0.1 {"label":"Stretch", "widget":"slider", "min":0, "max":1, "step":0.01}
@property {float} pressDownStrength = 0.1 {"label":"Press", "widget":"slider", "min":0, "max":1, "step":0.01}
@property {float} nudgeStrength = 0.1 {"label":"Nudge", "widget":"slider", "min":0, "max":1, "step":0.01}
@property {bool} pressLight = true {"label":"Show light on press"}
@property {bool} hoverLight = true {"label":"Show light on hover"}
@property {bool} constantStretch {"label":"Strecth every angle"}
*/
/*
@typedef InteractionSetup
@property {string} id
@property {string} groupId
@property {vec2} position = {0,0} {"widget":"spinbox", "min":-100, "max":100, "step":0.001}
@property {vec2} scale = {1,1} {"widget":"spinbox", "min":-100, "max":100, "step":0.001}
@property {bool} enabled = true
*/
/*
@typedef InteractionsInput
@property {bool} debugOnScreen
@property {InteractionSetup[]} addInteraction
*/
/*
@typedef ShapeSettings
@property {vec2} shapeScale = {1,1}
@property {vec2} shapePosition = {0,0} {"widget":"spinbox", "min":-100, "max":100, "step":0.001}
@ui {"widget":"label", "label":""}
@property {float} shapeSoftness = 0.4 {"widget":"slider", "min":0, "max":1, "step":0.01}
@property {vec4} cornerRadius = {0.25,0.25,0.25,0.25} {"widget":"slider", "min":0, "max":1, "step":0.01}
*/
/*
@typedef IconSettings
@property {float} iconScale = 1
@property {vec2} iconPosition = {0,0}
@property {float} maxBlur = 1 {"widget":"slider", "min":0, "max":10, "step":0.01}
@ui {"widget":"label", "label":""}
@property {bool} useColor {"label":"Mono Color"}
@property {vec3} iconColor = {0,0,0} {"widget":"color", "showIf":"useColor"}
@property {float} colorChannel {"widget":"slider", "min":0, "max":3, "step":1, "showIf":"useColor"}
*/
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
// @input int renderOrder
// @input float dampSpeed = 10
// @input bool bindTouchToInteraction
// @ui {"widget":"separator"}
// @input GlassSettings glassSettings
// @ui {"widget":"separator"}
// @input TouchSettings touchSettings
// @ui {"widget":"separator"}
// @input InteractionsInput interactions
// @ui {"widget":"separator"}
// @input ShapeSettings shapeSettings
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Icon Setup"}
// @input Asset.Texture icon0 {"label":"Icon Set"}
// @input IconSettings iconSettings
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @input Asset.Material material
// @input Asset.Material debugMaterial
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../Modules/Src/Assets/Liquid Glass UI Pack.lspkg/Liqmo Basic Button.lsc/Liqmo Basic Button");
Object.setPrototypeOf(script, Module.LiqmoBasicButton.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("renderOrder", []);
    checkUndefined("dampSpeed", []);
    checkUndefined("bindTouchToInteraction", []);
    checkUndefined("glassSettings", []);
    checkUndefined("touchSettings", []);
    checkUndefined("interactions", []);
    checkUndefined("shapeSettings", []);
    checkUndefined("icon0", []);
    checkUndefined("iconSettings", []);
    checkUndefined("material", []);
    checkUndefined("debugMaterial", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
