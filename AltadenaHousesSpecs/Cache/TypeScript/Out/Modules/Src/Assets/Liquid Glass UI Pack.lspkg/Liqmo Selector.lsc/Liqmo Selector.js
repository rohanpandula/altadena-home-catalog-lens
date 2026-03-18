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
exports.LG_Selector = exports.CustomBaseInteraction = exports.SelectedIconSetup = void 0;
var __selfType = requireType("./Liqmo Selector");
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
const LiqmoGlass_1 = require("./LiqmoGlass");
const HelpersForLS_1 = require("./HelpersForLS");
class SelectedIconSetup {
    constructor() {
        this.useColorAlt = false;
        this.iconColorAlt = new vec3(0, 0, 0);
        this.colorChannelAlt = 0;
    }
}
exports.SelectedIconSetup = SelectedIconSetup;
class CustomBaseInteraction {
    constructor() {
        this.position = new vec2(0, 0);
        this.scale = new vec2(1, 1);
    }
}
exports.CustomBaseInteraction = CustomBaseInteraction;
let LG_Selector = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = LiqmoGlass_1.LiqmoGlassBase;
    var LG_Selector = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.shapeSettings = this.shapeSettings;
            this.min = this.min;
            this.max = this.max;
            this.selectedIconsSetup = this.selectedIconsSetup;
            this.buttonType = this.buttonType;
            this.useCustomTouchArea = this.useCustomTouchArea;
            this.customBaseInteraction = this.customBaseInteraction;
            this.material = this.material;
            this.debugMaterial = this.debugMaterial;
            this.invisibleTex = this.invisibleTex;
            // Hide abstract class inputs
            this.interactions = [];
        }
        __initialize() {
            super.__initialize();
            this.shapeSettings = this.shapeSettings;
            this.min = this.min;
            this.max = this.max;
            this.selectedIconsSetup = this.selectedIconsSetup;
            this.buttonType = this.buttonType;
            this.useCustomTouchArea = this.useCustomTouchArea;
            this.customBaseInteraction = this.customBaseInteraction;
            this.material = this.material;
            this.debugMaterial = this.debugMaterial;
            this.invisibleTex = this.invisibleTex;
            // Hide abstract class inputs
            this.interactions = [];
        }
        onAwake() {
            global.touchSystem.touchBlocking = true;
            const parentButton = this.sceneObject
                .getParent()
                .getComponents("Component.ScriptComponent")
                .find((x) => x instanceof LiqmoGlass_1.LiqmoGlassBase);
            // Snatch and override parent button properties
            if (parentButton) {
                var parentSnatch = parentButton._initiateThumb(this.invisibleTex);
                this.iconSettings = parentSnatch.iconSettings;
            }
            else {
                throw new Error("Must be child of a Liqmo Glass Object");
            }
            //Add base interaction for the selection thingy
            this.interactions.unshift({
                id: "_customBase",
                groupId: "_buttonBase",
                position: this.useCustomTouchArea
                    ? this.customBaseInteraction.position
                    : parentSnatch.shapeSettings.shapePosition,
                scale: this.useCustomTouchArea
                    ? this.customBaseInteraction.scale
                    : parentSnatch.shapeSettings.shapeScale,
                enabled: true,
            });
            //Set initial values
            this.material = this.material.clone();
            this.debugMaterial.mainPass.isDebug = this.customBaseInteraction.debugOnScreen;
            this.damper.dampStrength = this.dampSpeed;
            //Selector material exceptions
            this.material.mainPass.magnification = this.selectedIconsSetup.selectorMagnification;
            if (this.selectedIconsSetup.icon1) {
                for (const s in this.selectedIconsSetup) {
                    this.material.mainPass[s] = this.selectedIconsSetup[s];
                }
            }
            else {
                this.material.mainPass.useAlt = false;
            }
            //Add SceneObject
            const mainButton = HelpersForLS_1.BatchUtils.createBatchSceneObject(this.sceneObject, "_button", ["ScreenTransform", "Image"], true);
            mainButton.Image.stretchMode = StretchMode.Fit;
            mainButton.Image.mainMaterial = this.material;
            mainButton.Image.setRenderOrder(this.renderOrder);
            // Initiate Liqmo Glass behaviour
            this.LG = new LiqmoGlass_1.LiqmoGlass(this, this.material, this.dampSpeed, this.glassSettings, this.touchSettings, this.shapeSettings, this.iconSettings);
            this.LG.bindScreenToInteraction = this.bindTouchToInteraction;
            // Initiate/map button interactions
            this.BID = new LiqmoGlass_1.ButtonDefinitions(this.sceneObject, this.interactions, this.debugMaterial, this.sceneObject.layer, this.renderOrder + 1, () => (this.LG.touchEnabled = true), () => {
                if (this.bindTouchToInteraction) {
                    this.LG.touchEnabled = false;
                    this.LG.screenTouchCanceled = true;
                }
            });
            this.BID.setSafeAreaFix(this);
            this.buttonFuncDefinitions = this.BID.buttonObjects;
            //INTERACTIONS
            const selectorInteraction = this.BID.getButtonObject("_customBase");
            const remapOuts = this.findMinMaxVec2Components(parentSnatch.interactionPositions);
            let damp;
            let initPosition;
            let lastPosition = selectorInteraction.ScreenTransform.localPointToScreenPoint(this.vec2Remap(this.shapeSettings.shapePosition, remapOuts.min, remapOuts.max, this.min, this.max));
            let lastSnapped = this.snapToClosest(this.shapeSettings.shapePosition, parentSnatch.interactionPositions).position;
            let dragging = false;
            selectorInteraction.InteractionComponent.onTouchStart.add((v) => {
                initPosition = v.position;
                if (!lastPosition)
                    lastPosition = v.position;
                if (damp)
                    this.damper.removeValue(damp);
            });
            selectorInteraction.InteractionComponent.onTouchMove.add((v) => {
                if (initPosition.distance(v.position) < 0.03 && !dragging)
                    return;
                dragging = true;
                lastPosition = v.position;
                const pos = selectorInteraction.ScreenTransform.screenPointToLocalPoint(v.position);
                this.material.mainPass.shapePosition = this.vec2Remap(pos, this.min, this.max, remapOuts.min, remapOuts.max);
            });
            //TODO FOR FUTURE: This one here a bit shit
            selectorInteraction.InteractionComponent.onTouchEnd.add((v) => {
                const lastLocalPosition = selectorInteraction.ScreenTransform.screenPointToLocalPoint(lastPosition);
                const lastLerped = this.vec2Remap(lastLocalPosition, this.min, this.max, remapOuts.min, remapOuts.max);
                const localPosition = selectorInteraction.ScreenTransform.screenPointToLocalPoint(v.position);
                const lerped = this.vec2Remap(localPosition, this.min, this.max, remapOuts.min, remapOuts.max);
                let snapped = this.snapToClosest(lerped, parentSnatch.interactionPositions).position;
                let buttonId = parentSnatch.interactionPositions.find(x => snapped === x.position).id;
                if (lastSnapped && this.buttonType === 1 && lastSnapped.distance(snapped) === 0) {
                    snapped = parentSnatch.interactionPositions.find(x => buttonId !== x.id).position;
                    buttonId = parentSnatch.interactionPositions.find(x => snapped === x.position).id;
                }
                const unlerp = this.vec2Remap(lerped, remapOuts.min, remapOuts.max, this.min, this.max); //Lerped but min/max of "0" clamped or u know iste
                const snappedUnlerp = this.vec2Remap(snapped, remapOuts.min, remapOuts.max, this.min, this.max); //Snapped local pos
                const sPosition = selectorInteraction.ScreenTransform.localPointToScreenPoint(snappedUnlerp); //Screen translated snapped pos
                const touchEndArgsExtra = v;
                touchEndArgsExtra.positionInRect = unlerp;
                touchEndArgsExtra.snappedPosInRect = this.vec2Remap(snappedUnlerp, this.min, this.max, vec2.one().uniformScale(-1), vec2.one());
                if (this.buttonType !== 2) {
                    const obj = parentSnatch.userButtonFunctions[buttonId].definitions;
                    obj.forEach(x => x(touchEndArgsExtra));
                }
                else {
                    const obj = this.findAnyDefinition(parentSnatch.userButtonFunctions).definitions;
                    if (obj) {
                        obj.forEach(x => x(touchEndArgsExtra));
                    }
                    else {
                        print("Slider needs at least one definitions, IDK ABOUT THIS ERROR MESSAGE");
                    }
                }
                damp = this.damper.addValue(lastLerped, (v) => {
                    this.material.mainPass.shapePosition = v;
                });
                this.damper.setTarget(damp, this.buttonType === 2 ? lerped : snapped);
                lastSnapped = snapped;
                lastPosition = this.buttonType === 2 ? v.position : sPosition;
                dragging = false;
            });
        }
        snapToClosest(v, targets) {
            if (!targets.length)
                throw new Error("Interactions array is empty");
            let closest = targets[0];
            let minDist = v.distance(closest.position);
            for (let i = 1; i < targets.length; i++) {
                const t = targets[i];
                const dist = v.distance(t.position);
                if (dist < minDist) {
                    minDist = dist;
                    closest = t;
                }
            }
            return closest;
        }
        findMinMaxVec2Components(targets) {
            if (!targets.length)
                throw new Error("Interactions array is empty");
            const min = new vec2(Infinity, Infinity);
            const max = new vec2(-Infinity, -Infinity);
            for (const { position: p } of targets) {
                max.x = Math.max(max.x, p.x);
                max.y = Math.max(max.y, p.y);
                min.x = Math.min(min.x, p.x);
                min.y = Math.min(min.y, p.y);
            }
            return { min, max };
        }
        vec2Remap(pos, minIn, maxIn, minOut, maxOut) {
            return new vec2((minIn.x === maxIn.x) ? 0 : MathUtils.remap(pos.x, minIn.x, maxIn.x, minOut.x, maxOut.x), (minIn.y === maxIn.y) ? 0 : MathUtils.remap(pos.y, minIn.y, maxIn.y, minOut.y, maxOut.y));
        }
        findAnyDefinition(obj) {
            let v = null;
            for (const [key, val] of Object.entries(obj)) {
                if (val) {
                    v = val;
                }
            }
            return v;
        }
    };
    __setFunctionName(_classThis, "LG_Selector");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        LG_Selector = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return LG_Selector = _classThis;
})();
exports.LG_Selector = LG_Selector;
//# sourceMappingURL=Liqmo%20Selector.js.map