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
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../Modules/Src/Assets/Liquid Glass UI Pack.lspkg/Liqmo Basic Button.lsc/LiqmoGlass");
Object.setPrototypeOf(script, Module.LiqmoGlassBase.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("renderOrder", []);
    checkUndefined("dampSpeed", []);
    checkUndefined("bindTouchToInteraction", []);
    checkUndefined("glassSettings", []);
    checkUndefined("touchSettings", []);
    checkUndefined("interactions", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
