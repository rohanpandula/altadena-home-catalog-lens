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
exports.UIController = void 0;
var __selfType = requireType("./UIController");
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
let UIController = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var UIController = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.sceneObjects = this.sceneObjects;
            this.textObject = this.textObject;
            this.counterText = this.counterText;
            this.nextButton = this.nextButton;
            this.previousButton = this.previousButton;
            this.currentIndex = 0;
        }
        __initialize() {
            super.__initialize();
            this.sceneObjects = this.sceneObjects;
            this.textObject = this.textObject;
            this.counterText = this.counterText;
            this.nextButton = this.nextButton;
            this.previousButton = this.previousButton;
            this.currentIndex = 0;
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(() => {
                this.onStart();
            });
        }
        onStart() {
            if (!this.sceneObjects || this.sceneObjects.length === 0) {
                print("No scene objects to navigate.");
                return;
            }
            // Activate the initial object
            this.activateCurrentObject();
            // Setup next button
            if (this.nextButton) {
                this.nextButton.onTriggerUp.add(() => {
                    this.currentIndex = (this.currentIndex + 1) % this.sceneObjects.length;
                    let delayEvent = this.createEvent("DelayedCallbackEvent");
                    delayEvent.bind(() => {
                        this.activateCurrentObject();
                    });
                    delayEvent.reset(0.2);
                });
            }
            // Setup previous button
            if (this.previousButton) {
                this.previousButton.onTriggerUp.add(() => {
                    this.currentIndex = (this.currentIndex - 1 + this.sceneObjects.length) % this.sceneObjects.length;
                    let delayEvent = this.createEvent("DelayedCallbackEvent");
                    delayEvent.bind(() => {
                        this.activateCurrentObject();
                    });
                    delayEvent.reset(0.2);
                });
            }
        }
        activateCurrentObject() {
            // Deactivate all objects
            this.sceneObjects.forEach((obj) => {
                obj.enabled = false;
            });
            // Activate the current object
            let currentObject = this.sceneObjects[this.currentIndex];
            currentObject.enabled = true;
            // Update the text object with the current object's name
            if (this.textObject) {
                this.textObject.text = currentObject.name;
            }
            // Update the counter text with current index / total count
            if (this.counterText) {
                this.counterText.text = `${this.currentIndex + 1}/${this.sceneObjects.length}`;
            }
        }
    };
    __setFunctionName(_classThis, "UIController");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        UIController = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return UIController = _classThis;
})();
exports.UIController = UIController;
//# sourceMappingURL=UIController.js.map