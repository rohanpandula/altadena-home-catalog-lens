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
exports.UIManager = void 0;
var __selfType = requireType("./UIManager");
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
const animate_1 = require("SpectaclesInteractionKit.lspkg/Utils/animate");
/**
 * UI States for the application
 */
var UIState;
(function (UIState) {
    UIState["MainMenu"] = "MainMenu";
    UIState["Home"] = "Home";
    UIState["ScreenA"] = "ScreenA";
    UIState["ScreenB"] = "ScreenB";
    UIState["ScreenC"] = "ScreenC";
})(UIState || (UIState = {}));
let UIManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var UIManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            // ===== Frame Reference =====
            this.frame = this.frame;
            this.initialFrameSize = this.initialFrameSize;
            this.expandedSize1 = this.expandedSize1;
            this.expandedSize2 = this.expandedSize2;
            this.resizeAnimationDuration = this.resizeAnimationDuration;
            this.homeButton = this.homeButton;
            this.screenAButton = this.screenAButton;
            this.screenCButton = this.screenCButton;
            this.homeContent = this.homeContent;
            this.screenAContent = this.screenAContent;
            this.screenBContent = this.screenBContent;
            this.screenCContent = this.screenCContent;
            this.sideMenuContent = this.sideMenuContent;
            this.startScreenBButton = this.startScreenBButton;
            this.exitScreenAButton = this.exitScreenAButton;
            this.exitScreenBButton = this.exitScreenBButton;
            this.currentState = UIState.Home;
            this.resizeAnimationCancel = new animate_1.CancelSet();
            this.initialized = false;
        }
        __initialize() {
            super.__initialize();
            // ===== Frame Reference =====
            this.frame = this.frame;
            this.initialFrameSize = this.initialFrameSize;
            this.expandedSize1 = this.expandedSize1;
            this.expandedSize2 = this.expandedSize2;
            this.resizeAnimationDuration = this.resizeAnimationDuration;
            this.homeButton = this.homeButton;
            this.screenAButton = this.screenAButton;
            this.screenCButton = this.screenCButton;
            this.homeContent = this.homeContent;
            this.screenAContent = this.screenAContent;
            this.screenBContent = this.screenBContent;
            this.screenCContent = this.screenCContent;
            this.sideMenuContent = this.sideMenuContent;
            this.startScreenBButton = this.startScreenBButton;
            this.exitScreenAButton = this.exitScreenAButton;
            this.exitScreenBButton = this.exitScreenBButton;
            this.currentState = UIState.Home;
            this.resizeAnimationCancel = new animate_1.CancelSet();
            this.initialized = false;
        }
        onAwake() {
            this.createEvent("OnStartEvent").bind(this.initialize.bind(this));
        }
        /**
         * Initialize the UI Manager and set up button event handlers
         */
        initialize() {
            if (this.initialized) {
                return;
            }
            // Validate required references
            if (!this.frame) {
                print("ERROR: UIManager - Frame reference is required!");
                return;
            }
            // Set up main menu button handlers
            if (this.homeButton) {
                this.homeButton.onTriggerUp.add(() => {
                    this.transitionToHome();
                });
            }
            if (this.screenAButton) {
                this.screenAButton.onTriggerUp.add(() => {
                    this.transitionToScreenA();
                });
            }
            if (this.screenCButton) {
                this.screenCButton.onTriggerUp.add(() => {
                    this.transitionToScreenC();
                });
            }
            // Set up Screen A button handlers
            if (this.startScreenBButton) {
                this.startScreenBButton.onTriggerUp.add(() => {
                    this.transitionToScreenB();
                });
            }
            if (this.exitScreenAButton) {
                this.exitScreenAButton.onTriggerUp.add(() => {
                    this.transitionToHome();
                });
            }
            // Set up Screen B button handlers
            if (this.exitScreenBButton) {
                this.exitScreenBButton.onTriggerUp.add(() => {
                    this.transitionToHome();
                });
            }
            // Initialize to Home state (with initial content visible)
            this.transitionToHome();
            this.initialized = true;
        }
        /**
         * Transition to Home state
         * Shows home content and hides other content
         */
        transitionToHome() {
            print("UIManager: Transitioning to Home");
            this.currentState = UIState.Home;
            // Hide all content
            this.hideAllContent();
            // Show Home content
            if (this.homeContent) {
                this.homeContent.enabled = true;
            }
            // Keep side menu visible
            if (this.sideMenuContent) {
                this.sideMenuContent.enabled = true;
            }
            // Resize frame to initial size
            this.animateFrameSize(this.initialFrameSize);
        }
        /**
         * Transition to Screen A state
         * Shows Screen A content and resizes frame
         */
        transitionToScreenA() {
            print("UIManager: Transitioning to Screen A");
            this.currentState = UIState.ScreenA;
            // Hide all content
            this.hideAllContent();
            // Show Screen A content
            if (this.screenAContent) {
                this.screenAContent.enabled = true;
            }
            // Hide side menu
            if (this.sideMenuContent) {
                this.sideMenuContent.enabled = false;
            }
            // Resize frame to expanded size 1 (vertically expanded)
            this.animateFrameSize(this.expandedSize1);
        }
        /**
         * Transition to Screen B state
         * Shows Screen B content
         */
        transitionToScreenB() {
            print("UIManager: Transitioning to Screen B");
            this.currentState = UIState.ScreenB;
            // Hide all content
            this.hideAllContent();
            // Show Screen B content
            if (this.screenBContent) {
                this.screenBContent.enabled = true;
            }
            // Keep frame at same size as Screen A
            // (already at expandedSize1 from previous state)
        }
        /**
         * Transition to Screen C state
         * Shows Screen C content and resizes frame, keeps side menu visible
         */
        transitionToScreenC() {
            print("UIManager: Transitioning to Screen C");
            this.currentState = UIState.ScreenC;
            // Hide all content
            this.hideAllContent();
            // Show Screen C content
            if (this.screenCContent) {
                this.screenCContent.enabled = true;
            }
            // Keep side menu visible
            if (this.sideMenuContent) {
                this.sideMenuContent.enabled = true;
            }
            // Resize frame to expanded size 2
            this.animateFrameSize(this.expandedSize2);
        }
        /**
         * Transition to Main Menu state
         * This is essentially the same as Home (shows home content by default)
         */
        transitionToMainMenu() {
            // Main menu is same as Home state
            this.transitionToHome();
        }
        /**
         * Hide all content objects
         */
        hideAllContent() {
            if (this.homeContent) {
                this.homeContent.enabled = false;
            }
            if (this.screenAContent) {
                this.screenAContent.enabled = false;
            }
            if (this.screenBContent) {
                this.screenBContent.enabled = false;
            }
            if (this.screenCContent) {
                this.screenCContent.enabled = false;
            }
        }
        /**
         * Animate frame's innerSize smoothly
         * @param targetSize - Target innerSize as vec2 (width, height)
         */
        animateFrameSize(targetSize) {
            if (!this.frame) {
                return;
            }
            // Cancel any ongoing resize animation
            this.resizeAnimationCancel.cancel();
            const startSize = this.frame.innerSize;
            const endSize = targetSize;
            // Animate the frame's innerSize property
            (0, animate_1.default)({
                duration: this.resizeAnimationDuration,
                cancelSet: this.resizeAnimationCancel,
                easing: "ease-in-out-cubic",
                update: (t) => {
                    const newSize = vec2.lerp(startSize, endSize, t);
                    this.frame.innerSize = newSize;
                }
            });
        }
        /**
         * Get current UI state (for debugging or external access)
         */
        getCurrentState() {
            return this.currentState;
        }
        /**
         * Manually set state (useful for testing or external control)
         */
        setState(state) {
            switch (state) {
                case UIState.MainMenu:
                    this.transitionToMainMenu();
                    break;
                case UIState.Home:
                    this.transitionToHome();
                    break;
                case UIState.ScreenA:
                    this.transitionToScreenA();
                    break;
                case UIState.ScreenB:
                    this.transitionToScreenB();
                    break;
                case UIState.ScreenC:
                    this.transitionToScreenC();
                    break;
                default:
                    print("UIManager: Unknown state - " + state);
            }
        }
    };
    __setFunctionName(_classThis, "UIManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        UIManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return UIManager = _classThis;
})();
exports.UIManager = UIManager;
//# sourceMappingURL=UIManager.js.map