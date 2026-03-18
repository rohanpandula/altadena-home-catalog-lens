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
// @ui {"widget":"group_start", "label":"Frame Settings"}
// @input AssignableType frame {"hint":"Reference to the Frame component that will be resized"}
// @input vec2 initialFrameSize = {33,18} {"hint":"Initial frame size (for Home/main menu) - only X and Y matter"}
// @input vec2 expandedSize1 = {33,28} {"hint":"Expanded frame size for Screen A state - only X and Y matter"}
// @input vec2 expandedSize2 = {33,35} {"hint":"Expanded frame size for Screen C state - only X and Y matter"}
// @input float resizeAnimationDuration = 0.4 {"hint":"Duration for frame resize animation (in seconds)"}
// @ui {"widget":"group_end"}
// @ui {"widget":"group_start", "label":"Main Menu Buttons"}
// @input AssignableType_1 homeButton {"hint":"Home button"}
// @input AssignableType_2 screenAButton {"hint":"Screen A button"}
// @input AssignableType_3 screenCButton {"hint":"Screen C button"}
// @ui {"widget":"group_end"}
// @ui {"widget":"group_start", "label":"Content Objects"}
// @input SceneObject homeContent {"hint":"Scene object containing Home content (text, etc.)"}
// @input SceneObject screenAContent {"hint":"Scene object containing Screen A content (instructions and buttons)"}
// @input SceneObject screenBContent {"hint":"Scene object containing Screen B content (exit button)"}
// @input SceneObject screenCContent {"hint":"Scene object containing Screen C grid content"}
// @input SceneObject sideMenuContent {"hint":"Scene object containing the side menu buttons (will be hidden in some states)"}
// @ui {"widget":"group_end"}
// @ui {"widget":"group_start", "label":"Screen A Buttons"}
// @input AssignableType_4 startScreenBButton {"hint":"Start Screen B button in Screen A"}
// @input AssignableType_5 exitScreenAButton {"hint":"Exit button in Screen A"}
// @ui {"widget":"group_end"}
// @ui {"widget":"group_start", "label":"Screen B Buttons"}
// @input AssignableType_6 exitScreenBButton {"hint":"Exit button in Screen B"}
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
var Module = require("../../../../../../../Modules/Src/Packages/SpectaclesInteractionKitExamples.lspkg/Examples/UIStarter/Scripts/UIManager");
Object.setPrototypeOf(script, Module.UIManager.prototype);
script.__initialize();
let awakeEvent = script.createEvent("OnAwakeEvent");
awakeEvent.bind(() => {
    checkUndefined("frame", []);
    checkUndefined("initialFrameSize", []);
    checkUndefined("expandedSize1", []);
    checkUndefined("expandedSize2", []);
    checkUndefined("resizeAnimationDuration", []);
    checkUndefined("homeButton", []);
    checkUndefined("screenAButton", []);
    checkUndefined("screenCButton", []);
    checkUndefined("homeContent", []);
    checkUndefined("screenAContent", []);
    checkUndefined("screenBContent", []);
    checkUndefined("screenCContent", []);
    checkUndefined("sideMenuContent", []);
    checkUndefined("startScreenBButton", []);
    checkUndefined("exitScreenAButton", []);
    checkUndefined("exitScreenBButton", []);
    if (script.onAwake) {
       script.onAwake();
    }
});
