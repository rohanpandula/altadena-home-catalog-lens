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
exports.CardStripBuilder = void 0;
var __selfType = requireType("./CardStripBuilder");
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
let CardStripBuilder = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var CardStripBuilder = _classThis = class extends _classSuper {
        constructor() {
            super();
            this.catalogManager = this.catalogManager;
            this.cardMaterial = this.cardMaterial;
            this.cardMesh = this.cardMesh;
            this.cameraObject = this.cameraObject;
            // Card dimensions in world units
            this.CARD_WIDTH = 8;
            this.CARD_HEIGHT = 6;
            this.CARD_SPACING = 2;
            this.IMAGE_SIZE = 5;
            this.manager = null;
            this.cardObjects = [];
        }
        __initialize() {
            super.__initialize();
            this.catalogManager = this.catalogManager;
            this.cardMaterial = this.cardMaterial;
            this.cardMesh = this.cardMesh;
            this.cameraObject = this.cameraObject;
            // Card dimensions in world units
            this.CARD_WIDTH = 8;
            this.CARD_HEIGHT = 6;
            this.CARD_SPACING = 2;
            this.IMAGE_SIZE = 5;
            this.manager = null;
            this.cardObjects = [];
        }
        onAwake() {
            this.createEvent('OnStartEvent').bind(() => this.onStart());
        }
        onStart() {
            this.manager = this.catalogManager;
            if (!this.manager) {
                print('[CardStripBuilder] ERROR: CatalogManager not assigned');
                return;
            }
            if (!this.cardMaterial) {
                print('[CardStripBuilder] ERROR: cardMaterial not assigned');
                return;
            }
            if (!this.cardMesh) {
                print('[CardStripBuilder] ERROR: cardMesh not assigned');
                return;
            }
            // Wait a frame for CatalogManager to initialize
            const delay = this.createEvent('DelayedCallbackEvent');
            delay.bind(() => {
                this.buildCards();
                this.setupInteraction();
            });
            delay.reset(0.3);
        }
        buildCards() {
            const houses = this.manager.getHouses();
            print('[CardStripBuilder] Building ' + houses.length + ' cards');
            for (let i = 0; i < houses.length; i++) {
                const house = houses[i];
                // Create card container
                const cardObj = global.scene.createSceneObject('Card_' + house.id);
                cardObj.setParent(this.sceneObject);
                // Position horizontally
                const xPos = i * (this.CARD_WIDTH + this.CARD_SPACING);
                cardObj.getTransform().setLocalPosition(new vec3(xPos, 0, 0));
                // --- Elevation image using RenderMeshVisual + cloned material ---
                const imageObj = global.scene.createSceneObject('ElevImg_' + house.id);
                imageObj.setParent(cardObj);
                imageObj.getTransform().setLocalPosition(new vec3(0, 1.0, 0));
                imageObj.getTransform().setLocalScale(new vec3(this.IMAGE_SIZE, this.IMAGE_SIZE * 0.75, 1));
                const rmv = imageObj.createComponent('Component.RenderMeshVisual');
                rmv.mesh = this.cardMesh;
                // Clone material so each card gets its own texture
                const mat = this.cardMaterial.clone();
                if (house.elevationTexture) {
                    mat.mainPass.baseTex = house.elevationTexture;
                }
                rmv.mainMaterial = mat;
                // --- House name label ---
                const textObj = global.scene.createSceneObject('Name_' + house.id);
                textObj.setParent(cardObj);
                textObj.getTransform().setLocalPosition(new vec3(0, -(this.IMAGE_SIZE * 0.5 + 0.5), 0));
                const text = textObj.createComponent('Component.Text');
                text.text = house.name;
                text.size = 10;
                text.horizontalAlignment = HorizontalAlignment.Center;
                text.verticalAlignment = VerticalAlignment.Center;
                this.cardObjects.push(cardObj);
            }
            print('[CardStripBuilder] Cards built successfully');
        }
        setupInteraction() {
            // Desktop: use touch/tap events
            this.createEvent('TouchStartEvent').bind((ev) => {
                this.handleTap(ev.getTouchPosition());
            });
            // Spectacles: use GestureModule pinch
            try {
                const gestureModule = require('LensStudio:GestureModule');
                gestureModule
                    .getPinchDownEvent(GestureModule.HandType.Right)
                    .add(() => this.handlePinch());
                gestureModule
                    .getPinchDownEvent(GestureModule.HandType.Left)
                    .add(() => this.handlePinch());
                print('[CardStripBuilder] Gesture interaction ready');
            }
            catch (e) {
                print('[CardStripBuilder] GestureModule not available (desktop mode)');
            }
        }
        handleTap(touchPos) {
            // Find closest card to tap using screen-space proximity
            if (!this.cameraObject)
                return;
            const cam = this.cameraObject.getComponent('Component.Camera');
            if (!cam)
                return;
            let bestIndex = -1;
            let bestDist = Infinity;
            for (let i = 0; i < this.cardObjects.length; i++) {
                const cardWorldPos = this.cardObjects[i]
                    .getTransform()
                    .getWorldPosition();
                const screenPos = cam.worldSpaceToScreenSpace(cardWorldPos);
                const dx = screenPos.x - touchPos.x;
                const dy = screenPos.y - touchPos.y;
                const dist = Math.sqrt(dx * dx + dy * dy);
                if (dist < bestDist) {
                    bestDist = dist;
                    bestIndex = i;
                }
            }
            // Threshold: card must be reasonably close to tap
            if (bestIndex >= 0 && bestDist < 0.15) {
                print('[CardStripBuilder] Tapped card ' + bestIndex);
                this.manager.selectHouse(bestIndex);
            }
        }
        handlePinch() {
            // On Spectacles, select the card closest to center of view
            if (!this.cameraObject)
                return;
            const camTransform = this.cameraObject.getTransform();
            const camPos = camTransform.getWorldPosition();
            const camForward = camTransform.forward;
            let bestIndex = -1;
            let bestDot = -Infinity;
            for (let i = 0; i < this.cardObjects.length; i++) {
                const cardPos = this.cardObjects[i]
                    .getTransform()
                    .getWorldPosition();
                const toCard = cardPos.sub(camPos).normalize();
                const dot = toCard.dot(camForward);
                if (dot > bestDot) {
                    bestDot = dot;
                    bestIndex = i;
                }
            }
            // Must be roughly in front of camera
            if (bestIndex >= 0 && bestDot > 0.9) {
                print('[CardStripBuilder] Pinch selected card ' + bestIndex);
                this.manager.selectHouse(bestIndex);
            }
        }
    };
    __setFunctionName(_classThis, "CardStripBuilder");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        CardStripBuilder = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return CardStripBuilder = _classThis;
})();
exports.CardStripBuilder = CardStripBuilder;
//# sourceMappingURL=CardStripBuilder.js.map