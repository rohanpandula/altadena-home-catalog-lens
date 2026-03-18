"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Damper = void 0;
exports.isNumericLike = isNumericLike;
/**
 * Check if numeric like
 */
function isNumericLike(v) {
    if (typeof v === 'number')
        return true;
    if (!v || typeof v !== 'object')
        return false;
    const keys = ['x', 'y', 'z', 'w'];
    return Object.values(v).every(val => typeof val === 'number') &&
        Object.keys(v).every(k => keys.includes(k));
}
/**
 * Damp numeric or vector values over time
 */
class Damper {
    constructor(self) {
        this.self = self;
        /** Strength of the damping effect — higher = faster */
        this.dampStrength = 8.0;
        this.epsilon = 0.0001;
        this.values = [];
        this.updateEvent = null;
    }
    /**
     * Add a value to be damped over time
     * @param initial Initial value
     * @param onUpdate Optional callback called every frame
     */
    addValue(initial, onUpdate) {
        const entry = {
            current: this.clone(initial),
            target: this.clone(initial),
            onUpdate
        };
        this.values.push(entry);
        if (!this.updateEvent)
            this.createUpdateEvent();
        return entry;
    }
    /**
     * Set a target for a damped value
     * @param entry The entry returned by `addValue`
     * @param target The new target value
     */
    setTarget(entry, target) {
        entry.target = target;
        if (!this.updateEvent)
            this.createUpdateEvent();
    }
    /**
     * Remove a damped entry from update loop
     */
    removeValue(entry) {
        const idx = this.values.indexOf(entry);
        if (idx >= 0)
            this.values.splice(idx, 1);
        if (this.values.length === 0)
            this.removeUpdateEvent();
    }
    createUpdateEvent() {
        this.updateEvent = this.self.createEvent("UpdateEvent");
        this.updateEvent.bind(this.update.bind(this));
    }
    removeUpdateEvent() {
        if (this.updateEvent) {
            this.self.removeEvent(this.updateEvent);
            this.updateEvent = null;
        }
    }
    update() {
        if (this.values.length === 0) {
            this.removeUpdateEvent();
            return;
        }
        const dt = getDeltaTime();
        const factor = Math.exp(-this.dampStrength * dt);
        const t = 1 - factor;
        let allDone = true;
        for (const v of this.values) {
            const newValue = this.dampValue(v.current, v.target, t);
            if (typeof newValue === "number") {
                v.current = newValue;
            }
            else {
                this.setTo(v.current, newValue);
            }
            const done = this.isDone(v.current, v.target);
            if (done) {
                this.setTo(v.current, v.target);
            }
            else {
                allDone = false;
            }
            v.onUpdate?.(v.current, done);
        }
        if (allDone)
            this.removeUpdateEvent();
    }
    dampValue(a, b, t) {
        if (typeof a === "number" && typeof b === "number") {
            return a + (b - a) * t;
        }
        if (a instanceof vec2 && b instanceof vec2)
            return vec2.lerp(a, b, t);
        if (a instanceof vec3 && b instanceof vec3)
            return vec3.lerp(a, b, t);
        if (a instanceof vec4 && b instanceof vec4)
            return vec4.lerp(a, b, t);
        return a;
    }
    setTo(a, b) {
        if (typeof a === "number" && typeof b === "number")
            return b;
        if (a instanceof vec2 && b instanceof vec2) {
            a.x = b.x;
            a.y = b.y;
        }
        else if (a instanceof vec3 && b instanceof vec3) {
            a.x = b.x;
            a.y = b.y;
            a.z = b.z;
        }
        else if (a instanceof vec4 && b instanceof vec4) {
            a.x = b.x;
            a.y = b.y;
            a.z = b.z;
            a.w = b.w;
        }
        return a;
    }
    isDone(a, b) {
        if (typeof a === "number" && typeof b === "number") {
            return Math.abs(a - b) < this.epsilon;
        }
        if (a instanceof vec2 && b instanceof vec2)
            return a.distance(b) < this.epsilon;
        if (a instanceof vec3 && b instanceof vec3)
            return a.distance(b) < this.epsilon;
        if (a instanceof vec4 && b instanceof vec4)
            return a.distance(b) < this.epsilon;
        return false;
    }
    clone(v) {
        if (typeof v === "number")
            return v;
        if (v instanceof vec2)
            return new vec2(v.x, v.y);
        if (v instanceof vec3)
            return new vec3(v.x, v.y, v.z);
        if (v instanceof vec4)
            return new vec4(v.x, v.y, v.z, v.w);
        throw new Error(`Unsupported type ${v}`);
    }
}
exports.Damper = Damper;
//# sourceMappingURL=Damper.js.map