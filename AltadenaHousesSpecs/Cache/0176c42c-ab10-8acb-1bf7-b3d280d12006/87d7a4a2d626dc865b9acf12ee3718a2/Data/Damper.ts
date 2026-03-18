/**
 * Scalar or vector
 */
export type NumericLike = number | vec2 | vec3 | vec4;

/**
 * Check if numeric like
 */
export function isNumericLike(v: any): v is NumericLike {
  if (typeof v === 'number') return true;
  if (!v || typeof v !== 'object') return false;
  const keys = ['x', 'y', 'z', 'w'];
  return Object.values(v).every(val => typeof val === 'number') &&
         Object.keys(v).every(k => keys.includes(k));
}

/**
 * Damped value entry
 */
export type DampEntry<T extends NumericLike> = {
    current: T;
    target: T;
    onUpdate?: (v: T, done: boolean) => void;
};

/**
 * Damp numeric or vector values over time
 */
export class Damper {
    /** Strength of the damping effect — higher = faster */
    public dampStrength: number = 8.0;
    private epsilon: number = 0.0001;
    private values: DampEntry<NumericLike>[] = [];
    private updateEvent: UpdateEvent | null = null;

    constructor(private self: BaseScriptComponent) {}

    /**
     * Add a value to be damped over time
     * @param initial Initial value
     * @param onUpdate Optional callback called every frame
     */
    addValue<T extends NumericLike>(initial: T, onUpdate?: (v: T, done: boolean) => void): DampEntry<T> {
        const entry: DampEntry<T> = {
            current: this.clone(initial),
            target: this.clone(initial),
            onUpdate
        };
        this.values.push(entry as DampEntry<NumericLike>);
        if (!this.updateEvent) this.createUpdateEvent();
        return entry;
    }

    /**
     * Set a target for a damped value
     * @param entry The entry returned by `addValue`
     * @param target The new target value
     */
    setTarget<T extends NumericLike>(entry: DampEntry<T>, target: T) {
        entry.target = target;
        if (!this.updateEvent) this.createUpdateEvent();
    }

    /**
     * Remove a damped entry from update loop
     */
    removeValue(entry: DampEntry<NumericLike>) {
        const idx = this.values.indexOf(entry);
        if (idx >= 0) this.values.splice(idx, 1);
        if (this.values.length === 0) this.removeUpdateEvent();
    }

    private createUpdateEvent() {
        this.updateEvent = this.self.createEvent("UpdateEvent");
        this.updateEvent.bind(this.update.bind(this));
    }

    private removeUpdateEvent() {
        if (this.updateEvent) {
            this.self.removeEvent(this.updateEvent);
            this.updateEvent = null;
        }
    }

    private update() {
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
            } else {
                this.setTo(v.current, newValue);
            }

            const done = this.isDone(v.current, v.target);
            if (done) {
                this.setTo(v.current, v.target);
            } else {
                allDone = false;
            }

            v.onUpdate?.(v.current, done);
        }

        if (allDone) this.removeUpdateEvent();
    }

    private dampValue(a: NumericLike, b: NumericLike, t: number): NumericLike {
        if (typeof a === "number" && typeof b === "number") {
            return a + (b - a) * t;
        }

        if (a instanceof vec2 && b instanceof vec2) return vec2.lerp(a, b, t);
        if (a instanceof vec3 && b instanceof vec3) return vec3.lerp(a, b, t);
        if (a instanceof vec4 && b instanceof vec4) return vec4.lerp(a, b, t);

        return a;
    }

    private setTo(a: NumericLike, b: NumericLike): NumericLike {
        if (typeof a === "number" && typeof b === "number") return b;

        if (a instanceof vec2 && b instanceof vec2) {
            a.x = b.x;
            a.y = b.y;
        } else if (a instanceof vec3 && b instanceof vec3) {
            a.x = b.x;
            a.y = b.y;
            a.z = b.z;
        } else if (a instanceof vec4 && b instanceof vec4) {
            a.x = b.x;
            a.y = b.y;
            a.z = b.z;
            a.w = b.w;
        }

        return a;
    }

    private isDone(a: NumericLike, b: NumericLike): boolean {
        if (typeof a === "number" && typeof b === "number") {
            return Math.abs(a - b) < this.epsilon;
        }

        if (a instanceof vec2 && b instanceof vec2) return a.distance(b) < this.epsilon;
        if (a instanceof vec3 && b instanceof vec3) return a.distance(b) < this.epsilon;
        if (a instanceof vec4 && b instanceof vec4) return a.distance(b) < this.epsilon;

        return false;
    }

    private clone<T extends NumericLike>(v: T): T {
        if (typeof v === "number") return v;

        if (v instanceof vec2) return new vec2(v.x, v.y) as T;
        if (v instanceof vec3) return new vec3(v.x, v.y, v.z) as T;
        if (v instanceof vec4) return new vec4(v.x, v.y, v.z, v.w) as T;

        throw new Error(`Unsupported type ${v}`);
    }
}
