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
exports.FloorPlanDismiss = void 0;
var __selfType = requireType("./FloorPlanDismiss");
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
let FloorPlanDismiss = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var FloorPlanDismiss = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.catalogManager = this.catalogManager;
            this.prevButton = this.prevButton;
            this.nextButton = this.nextButton;
            this.backButton = this.backButton;
            this.manager = null;
        }
        __initialize() {
            super.__initialize();
            this.catalogManager = this.catalogManager;
            this.prevButton = this.prevButton;
            this.nextButton = this.nextButton;
            this.backButton = this.backButton;
            this.manager = null;
        }
        onAwake() {
            this.createEvent('OnStartEvent').bind(() => this.onStart());
        }
        onStart() {
            this.manager = this.catalogManager;
            if (!this.manager) {
                print('[FloorPlanNav] ERROR: CatalogManager not assigned');
                return;
            }
            // Desktop: detect tap position to determine which button was hit
            this.createEvent('TouchStartEvent').bind((ev) => {
                if (!this.sceneObject.enabled)
                    return;
                const pos = ev.getTouchPosition();
                // Left edge = prev, right edge = next, center = flip, bottom = back
                if (pos.y > 0.8) {
                    this.manager.dismissFloorPlan();
                }
                else if (pos.x < 0.25) {
                    this.manager.prevHouse();
                }
                else if (pos.x > 0.75) {
                    this.manager.nextHouse();
                }
                else {
                    // Center tap = flip between elevation and floor plan
                    this.manager.flipCard();
                }
            });
            // Spectacles: use gestures
            try {
                const gestureModule = require('LensStudio:GestureModule');
                // Swipe-like: left hand pinch = prev, right hand pinch = next
                gestureModule
                    .getPinchDownEvent(GestureModule.HandType.Left)
                    .add(() => {
                    if (this.sceneObject.enabled) {
                        this.manager.prevHouse();
                    }
                });
                gestureModule
                    .getPinchDownEvent(GestureModule.HandType.Right)
                    .add(() => {
                    if (this.sceneObject.enabled) {
                        this.manager.nextHouse();
                    }
                });
                print('[FloorPlanNav] Gesture nav ready');
            }
            catch (e) {
                print('[FloorPlanNav] GestureModule not available (desktop mode)');
            }
        }
    };
    __setFunctionName(_classThis, "FloorPlanDismiss");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        FloorPlanDismiss = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return FloorPlanDismiss = _classThis;
})();
exports.FloorPlanDismiss = FloorPlanDismiss;
//# sourceMappingURL=FloorPlanDismiss.js.map