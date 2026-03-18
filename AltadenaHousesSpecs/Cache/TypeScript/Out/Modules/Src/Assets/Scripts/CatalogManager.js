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
exports.CatalogManager = void 0;
var __selfType = requireType("./CatalogManager");
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
/**
 * CatalogManager — Main orchestration script for the Catalog Lens.
 *
 * Attach to a root-level SceneObject. Drag elevation + floor plan textures
 * into the inspector arrays (same order as HOUSE_CATALOG in HouseData.ts).
 */
const HouseData_1 = require("./HouseData");
let CatalogManager = (() => {
    let _classDecorators = [component];
    let _classDescriptor;
    let _classExtraInitializers = [];
    let _classThis;
    let _classSuper = BaseScriptComponent;
    var CatalogManager = _classThis = class extends _classSuper {
        constructor() {
            super();
            // --- Inspector inputs ---
            this.elevationTextures = this.elevationTextures;
            this.floorPlanTextures = this.floorPlanTextures;
            this.cardStripRoot = this.cardStripRoot;
            this.floorPlanDisplay = this.floorPlanDisplay;
            this.floorPlanMesh = this.floorPlanMesh;
            this.floorPlanTitle = this.floorPlanTitle;
            this.floorPlanDetails = this.floorPlanDetails;
            this.floorPlanCounter = this.floorPlanCounter;
            // --- State ---
            this.houses = [];
            this.selectedIndex = -1;
            this.floorPlanMaterial = null;
            this.showingFloorPlan = false;
            this.isFlipping = false;
        }
        __initialize() {
            super.__initialize();
            // --- Inspector inputs ---
            this.elevationTextures = this.elevationTextures;
            this.floorPlanTextures = this.floorPlanTextures;
            this.cardStripRoot = this.cardStripRoot;
            this.floorPlanDisplay = this.floorPlanDisplay;
            this.floorPlanMesh = this.floorPlanMesh;
            this.floorPlanTitle = this.floorPlanTitle;
            this.floorPlanDetails = this.floorPlanDetails;
            this.floorPlanCounter = this.floorPlanCounter;
            // --- State ---
            this.houses = [];
            this.selectedIndex = -1;
            this.floorPlanMaterial = null;
            this.showingFloorPlan = false;
            this.isFlipping = false;
        }
        onAwake() {
            this.createEvent('OnStartEvent').bind(() => this.onStart());
        }
        onStart() {
            // Build the house info array
            for (let i = 0; i < HouseData_1.HOUSE_CATALOG.length; i++) {
                const entry = HouseData_1.HOUSE_CATALOG[i];
                this.houses.push({
                    id: entry.name.toLowerCase().replace(/\s+/g, '_'),
                    name: entry.name,
                    sqft: entry.sqft,
                    beds: entry.beds,
                    baths: entry.baths,
                    elevationTexture: this.elevationTextures[i],
                    floorPlanTexture: this.floorPlanTextures[i],
                });
            }
            // Clone the floor plan material once so we can swap textures safely
            if (this.floorPlanMesh) {
                this.floorPlanMaterial = this.floorPlanMesh.mainMaterial.clone();
                this.floorPlanMesh.mainMaterial = this.floorPlanMaterial;
            }
            // Start with floor plan hidden
            if (this.floorPlanDisplay) {
                this.floorPlanDisplay.enabled = false;
            }
            print('[CatalogManager] Initialized with ' + this.houses.length + ' houses');
        }
        // --- Public API ---
        getHouses() {
            return this.houses;
        }
        getHouseCount() {
            return this.houses.length;
        }
        getSelectedIndex() {
            return this.selectedIndex;
        }
        selectHouse(index) {
            if (index < 0 || index >= this.houses.length)
                return;
            this.selectedIndex = index;
            const house = this.houses[index];
            print('[CatalogManager] Selected: ' + house.name);
            // Show elevation first
            this.showingFloorPlan = false;
            if (this.floorPlanDisplay && this.floorPlanMaterial) {
                this.floorPlanMaterial.mainPass.baseTex = house.elevationTexture;
                this.floorPlanDisplay.enabled = true;
                // Set title
                if (this.floorPlanTitle) {
                    this.floorPlanTitle.text = house.name;
                }
                // Set details
                if (this.floorPlanDetails) {
                    this.floorPlanDetails.text =
                        house.sqft + ' sq ft  •  ' + house.beds + ' bed / ' + house.baths + ' bath';
                }
                // Set counter
                if (this.floorPlanCounter) {
                    this.floorPlanCounter.text =
                        (index + 1) + ' of ' + this.houses.length;
                }
                // Animate scale in
                const transform = this.floorPlanDisplay.getTransform();
                transform.setLocalScale(new vec3(0.01, 0.01, 0.01));
                this.animateScale(transform, vec3.one(), 0.4);
            }
            // Hide card strip
            if (this.cardStripRoot) {
                this.cardStripRoot.enabled = false;
            }
        }
        nextHouse() {
            if (this.selectedIndex < 0)
                return;
            const next = (this.selectedIndex + 1) % this.houses.length;
            this.selectHouse(next);
        }
        prevHouse() {
            if (this.selectedIndex < 0)
                return;
            const prev = (this.selectedIndex - 1 + this.houses.length) % this.houses.length;
            this.selectHouse(prev);
        }
        dismissFloorPlan() {
            if (!this.floorPlanDisplay)
                return;
            const transform = this.floorPlanDisplay.getTransform();
            this.animateScale(transform, new vec3(0.01, 0.01, 0.01), 0.3, () => {
                this.floorPlanDisplay.enabled = false;
            });
            // Re-show card strip
            if (this.cardStripRoot) {
                this.cardStripRoot.enabled = true;
            }
            this.selectedIndex = -1;
        }
        flipCard() {
            if (this.selectedIndex < 0 || this.isFlipping)
                return;
            if (!this.floorPlanDisplay || !this.floorPlanMaterial)
                return;
            const house = this.houses[this.selectedIndex];
            this.isFlipping = true;
            const quadObj = this.floorPlanMesh.getSceneObject();
            const transform = quadObj.getTransform();
            const baseScale = transform.getLocalScale();
            // Phase 1: scale X to 0 (card edge-on)
            this.animateValue(0, 1, 0.2, (t) => {
                const eased = t * t;
                const scaleX = baseScale.x * (1 - eased);
                transform.setLocalScale(new vec3(scaleX, baseScale.y, baseScale.z));
            }, () => {
                // Swap texture at midpoint
                this.showingFloorPlan = !this.showingFloorPlan;
                this.floorPlanMaterial.mainPass.baseTex = this.showingFloorPlan
                    ? house.floorPlanTexture
                    : house.elevationTexture;
                // Phase 2: scale X back to full
                this.animateValue(0, 1, 0.2, (t) => {
                    const eased = 1 - (1 - t) * (1 - t);
                    const scaleX = baseScale.x * eased;
                    transform.setLocalScale(new vec3(scaleX, baseScale.y, baseScale.z));
                }, () => {
                    transform.setLocalScale(baseScale);
                    this.isFlipping = false;
                });
            });
        }
        isShowingFloorPlan() {
            return this.showingFloorPlan;
        }
        animateValue(from, to, duration, onUpdate, onComplete) {
            let elapsed = 0;
            const evt = this.createEvent('UpdateEvent');
            evt.bind(() => {
                elapsed += getDeltaTime();
                const t = Math.min(elapsed / duration, 1.0);
                onUpdate(t);
                if (t >= 1.0) {
                    evt.enabled = false;
                    if (onComplete)
                        onComplete();
                }
            });
        }
        animateScale(transform, target, duration, onComplete) {
            const start = transform.getLocalScale();
            let elapsed = 0;
            const evt = this.createEvent('UpdateEvent');
            evt.bind(() => {
                elapsed += getDeltaTime();
                const t = Math.min(elapsed / duration, 1.0);
                const eased = t * (2 - t); // ease-out quad
                transform.setLocalScale(vec3.lerp(start, target, eased));
                if (t >= 1.0) {
                    evt.enabled = false;
                    if (onComplete)
                        onComplete();
                }
            });
        }
    };
    __setFunctionName(_classThis, "CatalogManager");
    (() => {
        const _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(_classSuper[Symbol.metadata] ?? null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        CatalogManager = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return CatalogManager = _classThis;
})();
exports.CatalogManager = CatalogManager;
//# sourceMappingURL=CatalogManager.js.map