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
@typedef ShapeSettings
@property {vec2} shapeScale = {1,1}
@property {vec2} shapePosition = {0,0} {"widget":"spinbox", "min":-100, "max":100, "step":0.001}
@ui {"widget":"label", "label":""}
@property {float} shapeSoftness = 0.4 {"widget":"slider", "min":0, "max":1, "step":0.01}
@property {vec4} cornerRadius = {0.25,0.25,0.25,0.25} {"widget":"slider", "min":0, "max":1, "step":0.01}
*/
/*
@typedef SelectedIconSetup
@property {float} selectorMagnification {"label":"Icon Magnification"}
@property {Asset.Texture} icon1 {"label":"Icon Set"}
@property {bool} useColorAlt {"label":"Mono Color"}
@property {vec3} iconColorAlt = {0,0,0} {"widget":"color", "showIf":"useColorAlt"}
@property {float} colorChannelAlt {"widget":"slider", "min":0, "max":3, "step":1, "showIf":"useColorAlt"}
*/
/*
@typedef CustomBaseInteraction
@property {bool} debugOnScreen
@property {vec2} position = {0,0} {"widget":"spinbox", "min":-100, "max":100, "step":0.001}
@property {vec2} scale = {1,1} {"widget":"spinbox", "min":-100, "max":100, "step":0.001}
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
// @input ShapeSettings shapeSettings
// @ui {"widget":"separator"}
// @ui {"widget":"group_start", "label":"Remap Touch Boundries"}
// @ui {"widget":"label", "label":"<p style='color: #3E434E; background-color: #818C9A; text-align: center;'>Boundry of button shape: <em><strong>[-1, 1, -1, 1]</strong></em><br>You need to remap these values to boundry of your menu<br>v</p>"}
// @input vec2 min = {-1,-1}
// @input vec2 max = {1,1}
// @ui {"widget":"group_end"}
// @ui {"widget":"separator"}
// @input SelectedIconSetup selectedIconsSetup
// @ui {"widget":"separator"}
// @input float buttonType {"widget":"combobox", "values":[{"label":"Default", "value":0}, {"label":"Switch", "value":1}, {"label":"Slider", "value":2}]}
// @input bool useCustomTouchArea
// @input CustomBaseInteraction customBaseInteraction {"showIf":"useCustomTouchArea"}
// @input Asset.Material material
// @input Asset.Material debugMaterial
// @input Asset.Texture invisibleTex
if (!global.BaseScriptComponent) {
    function BaseScriptComponent() {}
    global.BaseScriptComponent = BaseScriptComponent;
    global.BaseScriptComponent.prototype = Object.getPrototypeOf(script);
    global.BaseScriptComponent.prototype.__initialize = function () {};
    global.BaseScriptComponent.getTypeName = function () {
        throw new Error("Cannot get type name from the class, not decorated with @component");
    };
}
var Module = require("../../../../../Modules/Src/Assets/Liquid Glass UI Pack.lspkg/Liqmo Selector.lsc/Liqmo Selector");
Object.setPrototypeOf(script, Module.LG_Selector.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("renderOrder", []);
    checkUndefined("dampSpeed", []);
    checkUndefined("bindTouchToInteraction", []);
    checkUndefined("glassSettings", []);
    checkUndefined("touchSettings", []);
    checkUndefined("shapeSettings", []);
    checkUndefined("min", []);
    checkUndefined("max", []);
    checkUndefined("selectedIconsSetup", []);
    checkUndefined("buttonType", []);
    checkUndefined("useCustomTouchArea", []);
    checkUndefined("customBaseInteraction", [["useCustomTouchArea",true]]);
    checkUndefined("material", []);
    checkUndefined("debugMaterial", []);
    checkUndefined("invisibleTex", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
