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
exports.LiqmoBasicButton = void 0;
var __selfType = requireType("./Liqmo Basic Button");
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
let LiqmoBasicButton = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = LiqmoGlass_1.LiqmoGlassBase;
    var LiqmoBasicButton = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.shapeSettings = this.shapeSettings;
            this.icon0 = this.icon0;
            this.iconSettings = this.iconSettings;
            this.material = this.material;
            this.debugMaterial = this.debugMaterial;
        }
        __initialize() {
            super.__initialize();
            this.shapeSettings = this.shapeSettings;
            this.icon0 = this.icon0;
            this.iconSettings = this.iconSettings;
            this.material = this.material;
            this.debugMaterial = this.debugMaterial;
        }
        onAwake() {
            global.touchSystem.touchBlocking = true;
            //@ts-ignore - because of some ls decorator bullshit
            this.iconSettings.icon0 = this.icon0;
            //Add base interaction for the selection thing
            this.interactions.addInteraction.unshift({
                id: "_buttonBase",
                groupId: "_buttonBase",
                position: this.shapeSettings.shapePosition,
                scale: this.shapeSettings.shapeScale,
                enabled: true,
            });
            this.material = this.material.clone();
            this.debugMaterial.mainPass.isDebug = this.interactions.debugOnScreen;
            this.damper.dampStrength = this.dampSpeed;
            const mainButton = HelpersForLS_1.BatchUtils.createBatchSceneObject(this.sceneObject, "_button", ["Image"], true);
            mainButton.Image.stretchMode = StretchMode.Fit;
            mainButton.Image.mainMaterial = this.material;
            mainButton.Image.setRenderOrder(this.renderOrder);
            // Initiate Liqmo Glass behaviour
            this.LG = new LiqmoGlass_1.LiqmoGlass(this, this.material, this.dampSpeed, this.glassSettings, this.touchSettings, this.shapeSettings, this.iconSettings);
            this.LG.bindScreenToInteraction = this.bindTouchToInteraction;
            // Initiate/map button interactions
            this.BID = new LiqmoGlass_1.ButtonDefinitions(this.sceneObject, this.interactions.addInteraction, this.debugMaterial, this.sceneObject.layer, this.renderOrder + 1, () => (this.LG.touchEnabled = true), () => {
                if (this.bindTouchToInteraction) {
                    this.LG.touchEnabled = false;
                    this.LG.screenTouchCanceled = true;
                }
            });
            this.BID.setSafeAreaFix(this);
            this.buttonFuncDefinitions = this.BID.buttonObjects;
        }
    };
    __setFunctionName(_classThis, "LiqmoBasicButton");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        LiqmoBasicButton = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return LiqmoBasicButton = _classThis;
})();
exports.LiqmoBasicButton = LiqmoBasicButton;
;
//# sourceMappingURL=Liqmo%20Basic%20Button.js.map