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
exports.LiqmoGlassBase = exports.IconSettingsPlus = exports.LiqmoGlass = exports.ButtonDefinitions = exports.UserBtnEventMap = exports.InteractionsInput = exports.InteractionSetup = exports.MaterialTouchSetup = exports.TouchSettings = exports.IconSettings = exports.MorphShapeSettings = exports.ShapeSettings = exports.GlassSettings = void 0;
var __selfType = requireType("./LiqmoGlass");
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
const Damper_1 = require("./Damper");
const HelpersForLS_1 = require("./HelpersForLS");
class GlassSettings {
    constructor() {
        this.thickness = 2;
        this.frost = 1;
        this.transparency = 0;
        this.material = 0.7;
        this.useTex = false;
        this.baseColor = new vec4(0, 0, 0, 1);
        this.topLighting = false;
        this.lightAngle = 1;
        this.bleed = 10;
        this.chromaticAbbr = 1;
        this.chromaticAbbrOnSurface = false;
        this.quality = 20;
    }
}
exports.GlassSettings = GlassSettings;
class ShapeSettings {
    constructor() {
        this.shapeScale = new vec2(1, 1);
        this.shapePosition = new vec2(0, 0);
        this.shapeSoftness = 0.4;
        this.cornerRadius = new vec4(0.25, 0.25, 0.25, 0.25);
    }
}
exports.ShapeSettings = ShapeSettings;
class MorphShapeSettings {
    constructor() {
        this.shapeScale = new vec2(1, 1);
        this.shapePosition = new vec2(0, 0);
        this.shapeSoftness = 0.4;
        this.cornerRadius = new vec4(0.25, 0.25, 0.25, 0.25);
        this.childScale = new vec2(1, 1);
        this.childOffset = new vec2(0, 0);
        this.childRadius = new vec4(0.25, 0.25, 0.25, 0.25);
    }
}
exports.MorphShapeSettings = MorphShapeSettings;
class IconSettings {
    constructor() {
        this.iconScale = 1;
        this.iconPosition = new vec2(0, 0);
        this.maxBlur = 1;
        this.useColor = false;
        this.iconColor = new vec3(0, 0, 0);
        this.colorChannel = 0;
    }
}
exports.IconSettings = IconSettings;
class TouchSettings {
    constructor() {
        this.stretchStrength = 0.1;
        this.pressDownStrength = 0.1;
        this.nudgeStrength = 0.1;
        this.pressLight = true;
        this.hoverLight = true;
        this.constantStretch = false;
    }
}
exports.TouchSettings = TouchSettings;
class MaterialTouchSetup {
    constructor() {
        this.p0 = new vec2(0, 0);
        this.p1 = new vec2(0, 0);
        this.pressure = 0;
    }
}
exports.MaterialTouchSetup = MaterialTouchSetup;
class InteractionSetup {
    constructor() {
        this.position = new vec2(0, 0);
        this.scale = new vec2(1, 1);
        this.enabled = true;
    }
}
exports.InteractionSetup = InteractionSetup;
class InteractionsInput {
}
exports.InteractionsInput = InteractionsInput;
class UserBtnEventMap {
    constructor() {
        this.funcInteractions = {};
    }
    add(fn) {
        const id = Symbol();
        const reg = this.buttonObject.InteractionComponent.onTouchEnd.add(fn);
        this.funcInteractions[id] = { fn, reg };
        return id;
    }
    remove(id) {
        const data = this.funcInteractions[id];
        if (!data)
            return;
        this.buttonObject.InteractionComponent.onTouchEnd.remove(data.reg);
        delete this.funcInteractions[id];
    }
    get definitions() {
        return Object.getOwnPropertySymbols(this.funcInteractions).map(sym => this.funcInteractions[sym].fn);
    }
}
exports.UserBtnEventMap = UserBtnEventMap;
class ButtonDefinitions {
    constructor(sceneObject, buttonMapData, material, layer, renderOrder, touchStartCallback = function () { }, touchEndCallback = function () { }) {
        this.sceneObject = sceneObject;
        this.buttonMapData = buttonMapData;
        this.buttonObjects = {};
        this.buttonGroups = {};
        const aspect = global.scene.captureTarget.control.getAspect();
        let index = 0;
        for (const btn of buttonMapData) {
            if (!btn.id)
                console.warn(`Provide a button id for ${index}th interaction`);
            const current = new UserBtnEventMap();
            current.buttonObject = HelpersForLS_1.BatchUtils.createBatchSceneObject(sceneObject, `_${btn.id}`, ["ScreenTransform", "Image", "InteractionComponent"]);
            // const parentSize = current.buttonObject.Object.getParent().getComponent("Component.ScreenTransform").anchors.getSize().uniformScale(0.5);
            // const parentRatio = parentSize.x < parentSize.y ? new vec2(1, parentSize.x / parentSize.y) : new vec2(parentSize.y / parentSize.x, 1)
            current.buttonObject.Object.layer = layer;
            current.buttonObject.Object.enabled = btn.enabled;
            current.buttonObject.ScreenTransform.anchors.setSize(btn.scale.mult(new vec2(1, aspect)).uniformScale(2) // * 2 signed normalized size
            );
            current.buttonObject.ScreenTransform.anchors.setCenter(btn.position.mult(new vec2(1, aspect)).uniformScale(8) // * 2 signed normalized size * 4 Material plane
            );
            current.buttonObject.Image.stretchMode = StretchMode.Stretch;
            current.buttonObject.Image.setRenderOrder(renderOrder);
            current.buttonObject.Image.mainMaterial = material.clone();
            current.buttonObject.Image.mainMaterial.mainPass._textFixScale_ = btn.scale;
            current.buttonObject.Image.mainMaterial.mainPass.debugIndex = index - 1;
            if (btn.id.includes("_buttonBase"))
                current.buttonObject.Image.mainMaterial.mainPass.isDebug = false;
            current.buttonObject.InteractionComponent.isFilteredByDepth = false;
            current.buttonObject.InteractionComponent.onTouchStart.add(() => {
                touchStartCallback();
                current.buttonObject.Image.mainMaterial.mainPass.debugHit = true;
            });
            current.buttonObject.InteractionComponent.onTouchEnd.add(() => {
                touchEndCallback();
                current.buttonObject.Image.mainMaterial.mainPass.debugHit = false;
            });
            this.buttonObjects[btn.id] = current;
            (this.buttonGroups[btn.groupId] ??= []).push(btn.id);
            index++;
        }
    }
    getButtonObject(id) {
        return this.buttonObjects[id].buttonObject;
    }
    getButtonGroups(groupId) {
        return this.buttonGroups[groupId].map(x => this.buttonObjects[x].buttonObject);
    }
    setSafeAreaFix(script) {
        const screenRegionObject = this.getScreenRegionParent(this.sceneObject);
        const isSafeRegion = screenRegionObject.getComponent("Component.ScreenRegionComponent").region === ScreenRegionType.SafeRender;
        if (!isSafeRegion)
            return;
        // WARNING: Delay is not desired, but render region modifications is not onAwake, probably, idk it works so
        HelpersForLS_1.QuickUtils.delayedCall(.01, script, () => {
            const top = screenRegionObject.getComponent("Component.ScreenTransform").localPointToScreenPoint(new vec2(0, 1)).y;
            const bottom = screenRegionObject.getComponent("Component.ScreenTransform").localPointToScreenPoint(new vec2(0, -1)).y;
            const fixRatio = Math.abs(top - bottom);
            for (const btn of this.buttonMapData) {
                const size = this.buttonObjects[btn.id].buttonObject.ScreenTransform.anchors.getSize();
                const center = this.buttonObjects[btn.id].buttonObject.ScreenTransform.anchors.getCenter();
                //We assume screen is always vertical
                this.buttonObjects[btn.id].buttonObject.ScreenTransform.anchors.setSize(size.mult(new vec2(1, 1 / fixRatio)));
                this.buttonObjects[btn.id].buttonObject.ScreenTransform.anchors.setCenter(center.mult(new vec2(1, 1 / fixRatio)));
            }
        });
    }
    getScreenRegionParent(obj) {
        if (obj.getComponent("Component.ScreenRegionComponent")) {
            return obj;
        }
        else if (obj.getParent()) {
            return this.getScreenRegionParent(obj.getParent());
        }
        else {
            return null;
        }
    }
}
exports.ButtonDefinitions = ButtonDefinitions;
class LiqmoGlass {
    constructor(button, /// ??? whole component
    material, dampSpeed, glassSettings = new GlassSettings(), touchSettings = new TouchSettings(), shapeSettings = new ShapeSettings(), iconSettings = new IconSettings(), materialIcon) {
        this.button = button;
        this.material = material;
        this.dampSpeed = dampSpeed;
        this.glassSettings = glassSettings;
        this.touchSettings = touchSettings;
        this.shapeSettings = shapeSettings;
        this.iconSettings = iconSettings;
        this.materialIcon = materialIcon;
        this.bindScreenToInteraction = false;
        this.touchEnabled = false;
        this.screenTouchCanceled = false;
        this.lastStates = new MaterialTouchSetup();
        this.damper = new Damper_1.Damper(button);
        this.damper.dampStrength = dampSpeed;
        for (const prop in glassSettings) {
            material.mainPass[prop] = glassSettings[prop];
            if (materialIcon)
                materialIcon.mainPass[prop] = glassSettings[prop];
        }
        for (const prop in shapeSettings) {
            material.mainPass[prop] = shapeSettings[prop];
            if (materialIcon)
                materialIcon.mainPass[prop] = shapeSettings[prop];
        }
        for (const prop in touchSettings) {
            material.mainPass[prop] = touchSettings[prop];
            if (materialIcon)
                materialIcon.mainPass[prop] = touchSettings[prop];
        }
        for (const prop in iconSettings) {
            material.mainPass[prop] = iconSettings[prop];
        }
        button
            .createEvent("TouchStartEvent")
            .bind(this.screenTouchStart.bind(this));
        button
            .createEvent("TouchMoveEvent")
            .bind(this.screenTouchMove.bind(this));
        button
            .createEvent("TouchEndEvent")
            .bind(this.screenTouchEnd.bind(this));
    }
    screenTouchStart(e) {
        if (!this.touchEnabled)
            return;
        this.initPosition = e.getTouchPosition();
        this.lastStates.p0 = this.initPosition;
        this.material.mainPass.p0 = this.initPosition;
        this.material.mainPass.p1 = this.initPosition;
        this.material.mainPass.touchInput = this.initPosition;
        const pressureOn = this.damper.addValue(0, (v) => {
            this.material.mainPass.pressure = v;
            this.lastStates.pressure = v;
        });
        this.damper.setTarget(pressureOn, 0.7);
    }
    screenTouchMove(e) {
        if (this.screenTouchCanceled && this.bindScreenToInteraction)
            this.screenTouchEnd();
        if (!this.touchEnabled)
            return;
        this.currentPosition = e.getTouchPosition();
        this.lastStates.p1 = this.currentPosition;
        this.material.mainPass.touchInput = this.currentPosition;
        this.material.mainPass.p1 = this.currentPosition;
    }
    screenTouchEnd(e) {
        if (!this.screenTouchCanceled && this.bindScreenToInteraction)
            return;
        if (!this.touchEnabled && !this.bindScreenToInteraction)
            return;
        if (e)
            this.currentPosition = e.getTouchPosition();
        this.touchEnabled = false;
        this.screenTouchCanceled = false;
        const pressureOff = this.damper.addValue(this.lastStates.pressure, (v) => (this.material.mainPass.pressure = v));
        this.damper.setTarget(pressureOff, 0);
    }
}
exports.LiqmoGlass = LiqmoGlass;
class IconSettingsPlus extends IconSettings {
}
exports.IconSettingsPlus = IconSettingsPlus;
let LiqmoGlassBase = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var LiqmoGlassBase = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.renderOrder = this.renderOrder;
            this.dampSpeed = this.dampSpeed;
            this.bindTouchToInteraction = this.bindTouchToInteraction;
            this.glassSettings = this.glassSettings;
            this.touchSettings = this.touchSettings;
            this.interactions = this.interactions;
            this.buttonFuncDefinitions = {};
            this.damper = new Damper_1.Damper(this);
        }
        __initialize() {
            super.__initialize();
            this.renderOrder = this.renderOrder;
            this.dampSpeed = this.dampSpeed;
            this.bindTouchToInteraction = this.bindTouchToInteraction;
            this.glassSettings = this.glassSettings;
            this.touchSettings = this.touchSettings;
            this.interactions = this.interactions;
            this.buttonFuncDefinitions = {};
            this.damper = new Damper_1.Damper(this);
        }
        get isButtonTouch() {
            return this.LG.touchEnabled;
        }
        get customButtonFunctions() {
            return this.buttonFuncDefinitions;
        }
        get customInteractions() {
            const arr = [];
            for (const item of this.interactions.addInteraction) {
                if (item.id && item.id !== "_buttonBase") {
                    arr.push(item);
                }
            }
            return arr;
        }
        set userButtonFunctions(_) {
            throw new Error("Cannot reassign.\nYou may add methods to your buttons via userButtonFunctions.buttonId");
        }
        //Duzeltme!!! boku cikti
        _initiateThumb(invisibleTex, iconSetToSelection = "icon0") {
            const iconSettings = this.iconSettings;
            const shapeSettings = this.shapeSettings;
            const interactionPositions = this.interactions.addInteraction.reduce((acc, curr, i) => {
                if (curr.id !== "_buttonBase")
                    acc.push({ id: curr.id, position: curr.position });
                return acc;
            }, []);
            //Pass and override user functions
            if (!this.interactions.debugOnScreen) {
                var userButtonFunctions = this.buttonFuncDefinitions;
                this.interactions.addInteraction.forEach(x => {
                    if (!x.id.includes("_buttonBase"))
                        this.modifyInteraction(x.id, false);
                });
            }
            else {
                console.warn("Screen debugging is on! Selector buttond may not work properly in this mode.");
            }
            ;
            //Override icon
            this.modifyIconSet({
                [iconSetToSelection]: invisibleTex,
                useColor: false,
            });
            return {
                shapeSettings: shapeSettings,
                iconSettings: iconSettings,
                interactionPositions: interactionPositions,
                userButtonFunctions: userButtonFunctions,
            };
        }
        modifyInteraction(buttonId, visible = true) {
            const t = this.BID.getButtonObject(buttonId).Object;
            t.enabled = visible;
        }
        modifyInteractionGroup(groupId, visible = true) {
            const t = this.BID.getButtonGroups(groupId);
            t.forEach((x) => (x.Object.enabled = visible));
        }
        modifyShape(shapeSettings) {
            for (const prop in shapeSettings) {
                const dampEntry = this.damper.addValue(this.shapeSettings[prop], (v) => { this.material.mainPass[prop] = v; });
                this.damper.setTarget(dampEntry, shapeSettings[prop]);
            }
        }
        modifyIconSet(iconSettings) {
            for (const prop in iconSettings) {
                if ((0, Damper_1.isNumericLike)(prop)) {
                    const dampEntry = this.damper.addValue(this.iconSettings[prop], (v) => { this.material.mainPass[prop] = v; });
                    this.damper.setTarget(dampEntry, iconSettings[prop]);
                }
                else {
                    this.material.mainPass[prop] = iconSettings[prop];
                }
            }
        }
        modifyGlass(glassSettings) {
            for (const prop in glassSettings) {
                if ((0, Damper_1.isNumericLike)(prop)) {
                    const dampEntry = this.damper.addValue(this.glassSettings[prop], (v) => { this.material.mainPass[prop] = v; });
                    this.damper.setTarget(dampEntry, glassSettings[prop]);
                }
                else {
                    this.material.mainPass[prop] = glassSettings[prop];
                }
            }
        }
        modifyTouch(touchSettings) {
            for (const prop in touchSettings) {
                const dampEntry = this.damper.addValue(this.touchSettings[prop], (v) => { this.material.mainPass[prop] = v; });
                this.damper.setTarget(dampEntry, touchSettings[prop]);
            }
        }
        //Reset
        resetShape() {
            for (const prop in this.shapeSettings) {
                const dampEntry = this.damper.addValue(this.material.mainPass[prop], (v) => { this.material.mainPass[prop] = v; });
                this.damper.setTarget(dampEntry, this.shapeSettings[prop]);
            }
        }
        resetIconSet() {
            for (const prop in this.iconSettings) {
                if ((0, Damper_1.isNumericLike)(prop)) {
                    const dampEntry = this.damper.addValue(this.material.mainPass[prop], (v) => { this.material.mainPass[prop] = v; });
                    this.damper.setTarget(dampEntry, this.iconSettings[prop]);
                }
                else {
                    this.material.mainPass[prop] = this.iconSettings[prop];
                }
            }
        }
        resetGlass() {
            for (const prop in this.glassSettings) {
                if ((0, Damper_1.isNumericLike)(prop)) {
                    const dampEntry = this.damper.addValue(this.material.mainPass[prop], (v) => { this.material.mainPass[prop] = v; });
                    this.damper.setTarget(dampEntry, this.glassSettings[prop]);
                }
                else {
                    this.material.mainPass[prop] = this.glassSettings[prop];
                }
            }
        }
        resetTouch() {
            for (const prop in this.touchSettings) {
                const dampEntry = this.damper.addValue(this.material.mainPass[prop], (v) => { this.material.mainPass[prop] = v; });
                this.damper.setTarget(dampEntry, this.touchSettings[prop]);
            }
        }
    };
    __setFunctionName(_classThis, "LiqmoGlassBase");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        LiqmoGlassBase = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return LiqmoGlassBase = _classThis;
})();
exports.LiqmoGlassBase = LiqmoGlassBase;
//# sourceMappingURL=LiqmoGlass.js.map