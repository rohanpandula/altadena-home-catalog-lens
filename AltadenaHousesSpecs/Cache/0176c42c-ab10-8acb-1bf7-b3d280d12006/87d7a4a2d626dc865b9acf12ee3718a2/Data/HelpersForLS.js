/**
 * https://github.com/c42m05/HelperFunctionsForLS
 * 
 * This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published 
 * by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied 
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>. 
 */

//#region <BATCH UTILS DEFINITIONS> 
/**
 * Writes attributes to the root object and defines getters and setters for them.
 * @param {SceneObject | Object.<string, any>} root - The root object where attributes will be added.
 * @param {Object.<string, any>} attr - An object containing key-value pairs of attributes.
 * @param {Number} [slice=1] - The number of characters to remove from attribute keys before defining them -to remove prefixes.
 *
 * @example
 * const root = {};
 * const attributes = {
 *   _speed: 5,
 *   _health: 100
 * };
 *
 * HelperUtils.writeAttributes(root, attributes, false, 1);
 *
 * // Access without prefix
 * print(root.speed); // 5
 * print(root.health); // 100
 *
 * // Modify
 * root.health = 80;
 * print(attributes._health); // 80
 *
 * // List attribute keys
 * print(root.attrKeys); // ['speed', 'health']
 */
function writeAttributes(root, attr, readOnly = false, slice = 1) {
    for (const key in attr) {
        const propName = key.slice(slice);
        const descriptor = Object.getOwnPropertyDescriptor(root, propName);
        
        if (!descriptor || descriptor.configurable) {
            if(readOnly){
                Object.defineProperty(root, propName, {
                    value: attr[key],
                    writable: false,
                    enumerable: true,
                })
            } else {                        
                Object.defineProperty(root, propName, {
                    get: function () {
                        return attr[key];
                    },
                    set: function (value) {
                        attr[key] = value;
                    },
                    enumerable: true,
                });
            }
        }
    }

    Object.defineProperty(root, "attrKeys", {
        get: function() {
            return Object.keys(attr).map(k => k.slice(slice));
        },
        enumerable: true,
    });
}

/**
 * @typedef {keyof ComponentNameMap} ComponentNameKey
 * @typedef {ComponentNameMap & {"Object": SceneObject}} BatchSceneObject
 */

/**
 * Creates a scene object and adds specified components to it.
 * @param {SceneObject} root - The parent scene object to attach the scene object to.
 * @param {string} objectName - The name of the new scene object.
 * @param {ComponentNameKey[]} componentNames - An array of component names to add.
 * @param {boolean} [override=false] - If true, uses the root object directly instead of creating a new one.
 * @returns {BatchSceneObject} An object mapping component short names (without "Component." or "Physics." prefixes) and "Object" to the created components and scene object.
 *
 * @example
 * // Creates a new scene object named "MyObject" under root,
 * // with "Component.RenderMeshVisual" and "Physics.RigidBody" components.
 * const components = createBatchSceneObject(root, "MyObject", ["Component.RenderMeshVisual", "Physics.RigidBody"]);
 * // Access the render mesh visual component:
 * const renderMeshVisual = components.RenderMeshVisual;
 * // Access the physics rigid body component:
 * const rigidBody = components.RigidBody;
 * // Access the scene object itself:
 * const sceneObj = components.Object;
 */
function createBatchSceneObject(root, objectName, componentNames, override = false) {
    let sceneComponent = root;
    if(!override) {
        sceneComponent = global.scene.createSceneObject(objectName);
        sceneComponent.setParent(root);
    }

    const components = {};
    for(const n of componentNames) {
        components[n.replace(/^(Component\.|Physics\.)/, "")] = sceneComponent.createComponent(n);
    }
    components["Object"] = sceneComponent;

    return components;
}

/**
 * Executes a specified function by name on each object in an array of callees.
 * Catches and logs any errors thrown by the called functions, including the stack location.
 *
 * @param {string} funcName - The name of the function to call on each callee.
 * @param {Array<Object>} [callees=[]] - The array of objects that may contain the method.
 * @param {*} [property=null] - An optional argument to pass to the function when called.
 * 
 * @example
 * const objects = [
 *   { greet(name) { print(`Hello, ${name}!`); } },
 *   { greet(name) { print(`Hi there, ${name}!`); } },
 *   { greet() { throw new Error("Oops!"); } },
 * ];
 *
 * batchExecute('greet', objects, 'Alice');
 * // Output:
 * // Hello, Alice!
 * // Hi there, Alice!
 * // Error: Oops! on at index 2 in greet
 */
function batchExecute(funcName, callees = [], property = null) {
    for (let i in callees) {
        try {
            const callee = callees[i];

            if (callee[funcName]) {
                property !== null
                    ? callee[funcName](property)
                    : callee[funcName]();
            }
        } catch (error) {
            const stackLines = error.stack.split("\n");
            const location = stackLines[1].trim();
            print(
                `${error} on ${
                    location || "Unknown"
                } at index ${i} in ${funcName}`
            );
        }
    }
}
//#endregion

//#region <QUICK UTILS DEFINITIONS>
/**
 * Executes a callback function after a specified delay using an update loop.
 *
 * @param {number} delay - Time in seconds to wait before invoking the callback.
 * @param {ScriptComponent} script - The script component used to create and manage the update event.
 * @param {Function} callback - The function to execute after the delay.
 */
function delayedCall(delay, script, callback) {
    const update = script.createEvent("UpdateEvent");
    let isCalled = false;
    let time = 0;
    update.bind(()=>{
        time += getDeltaTime();
        if(time > delay && !isCalled) {
            isCalled = true;
            callback();
            script.removeEvent(update);
        }
    });
}

/**
 * Deep copies properties from one object to another, with optional recursion and exceptions.
 *
 * @param {Object.<string, any>} copyFrom - The source object to copy properties from.
 * @param {Object.<string, any>} copyTo - The target object to copy properties to.
 * @param {Object} [options={}] - Optional settings.
 * @param {boolean} [options.recursive=false] - If true, performs deep copying on nested objects.
 * @param {string[]} [options.exceptions=[]] - List of property names to skip during copying.
 *
 * @returns {void}
 * 
 * @note This function does not handle circular references and may lead to stack overflows on deeply nested objects.
 *
 * @example
 * const source = { a: 1, b: new vec2(1, 2), c: { d: 3 } };
 * const target = {};
 * deepCopyObject(source, target, { recursive: true });
 * // target is a deep copy of source, preserving vector instances
 */
function deepCopyObject(copyFrom, copyTo, {recursive = false, exceptions = []} = {}) {
    for (const a in copyFrom) {
        if(exceptions.includes(a)) continue;
        const value = copyFrom[a];
        if (typeof value === "object" && value !== null) {
            if (value instanceof vec2) copyTo[a] = new vec2(value.x, value.y);
            else if (value instanceof vec3) copyTo[a] = new vec3(value.x, value.y, value.z);
            else if (value instanceof vec4) copyTo[a] = new vec4(value.x, value.y, value.z, value.w);
            else if (value instanceof quat) copyTo[a] = new quat(value.x, value.y, value.z, value.w);
            else if (recursive) {
                copyTo[a] = Array.isArray(value) 
                    ? value.map(v => (typeof v === "object" && v !== null ? this.deepCopyObject(v, {}, true) : v)) 
                    : this.deepCopyObject(value, {}, true);
            } else {
                copyTo[a] = Array.isArray(value) ? [...value] : { ...value };
            }
        } else {
            copyTo[a] = value;
        }
    }
}

/**
 * @typedef {(this: InteractionComponent, ...args: any[]) => any } InteractionComponentMethod
 * @typedef {(this: ColliderComponent, ...args: any[]) => any } ColliderComponentMethod
 * @typedef {keyof EventNameMap} EventNameKeys
 */

/**
 * Animates text in a typewriter style, rendering characters one-by-one with optional callbacks:
 * user interruption, spelling errors, and line-by-line behavior.
 *
 * @function typewriter
 * @param {string | Text} text - A string or an object with a `text` property to animate.
 * @param {ScriptComponent} script - The Lens Studio script component to bind events to.
 * @param {Object} [options={}] - Optional configuration settings.
 * @param {string} [options.splitter="\n"] - Delimiter used to separate lines.
 * @param {boolean} [options.recover=true] - Cant remember right now ???
 * @param {EventNameKeys | InteractionComponentMethod | ColliderComponentMethod} [options.skipOn=null] - Event name or interaction object that allows skipping the current line.
 * @param {EventNameKeys | InteractionComponentMethod | ColliderComponentMethod} [options.killOn=null] - Event name or interaction object that stops the typing early.
 * @param {number} [options.reset=5] - Base typing delay in milliseconds.
 * @param {number} [options.wait=1] - Time in seconds to wait between lines.
 * @param {boolean} [options.clearAtEnd=true] - Whether to clear the text field when finished.
 * @param {string} [options.clearedText=""] - Text to set when cleared.
 * @param {number} [options.timingError=10] - Random timing offset range in milliseconds.
 * @param {number} [options.spellErrorChance=0.01] - Probability of a spelling error occurring during typing.
 * @param {number} [options.backspaceTime=50] - Delay before backspacing a spelling error, in milliseconds.
 * @param {Function} [options.callback=null] - Called once the entire typing animation is finished.
 * @param {Function} [options.callbackBySplitter=null] - Called at the end of each line (splitter).
 * @param {Function} [options.callbackByType=null] - Called after each character is typed.
 *
 * @example
 * // Basic usage:
 * const myText = script.getSceneObject().getComponent("Component.Text");
 * myText.text = "This will be replaced.";
 * 
 * typewriter(myText, script, {
 *   reset: 50,
 *   splitter: "\n",
 *   callback: () => print("Typing complete!"),
 *   callbackBySplitter: () => print("Next paragraph..."),
 *   callbackByType: () => print("Typed a character."),
 *   skipOn: "TapEvent",
 *   killOn: "TouchEndEvent"
 * });
 */

function typewriter(
    text,
    script,
    {
        splitter = "\n",
        recover = true,
        skipOn = null,
        killOn = null,
        reset = 5,
        wait = 1,
        clearAtEnd = true,
        clearedText = "",
        timingError = 10,
        spellErrorChance = 0.01,
        backspaceTime = 50,
        callback = null,
        callbackBySplitter = null,
        callbackByType = null
    } = {}
) {
    let textBuffer;
    let textInput;
    if (typeof text === "object" && text !== null) {
        textBuffer = text.text;
        textInput = text;
        textInput.text = "";
    } else if (typeof text === "string"){
        textBuffer = text;
        textInput = script.getSceneObject().createComponent("Component.Text");
        textInput.text = "";
    } else {
        print("Input must be a string or an object with a 'text' property");
        return;
    }

    let p = 0;
    let l = 0;
    let last = getTime();
    let isWaiting = false;
    let skipped = false;
    let misspelled = false;
    let spellError = "";

    const paragraph = textBuffer.split(splitter);
    let letters = paragraph[p].split("");

    let userEvent;
    if (typeof skipOn === "string") {
        userEvent = script.createEvent(skipOn);
        userEvent.bind(() => {
            l += letters.length;
            skipped = true;
        });
    }

    if (typeof skipOn === "object" && skipOn !== null) {
        //@ts-expect-error
        skipOn.add(() => {
            l += letters.length;
            skipped = true;
        });
    }
    
    const update = script.createEvent("UpdateEvent");

    let killEvent;
    if (typeof killOn === "string") {
        killEvent = script.createEvent(killOn);
        killEvent.bind(() => {
            script.removeEvent(update);
        });
    }

    if (typeof killOn === "object" && killOn !== null) {
        //@ts-expect-error
        killOn.add(() => {
            script.removeEvent(update);
        });
    }
    
    update.bind(() => {
        const current = getTime();
        const pLen = paragraph.length;
        const lLen = letters.length;
        const delta = current - last;
        const noise = (Math.random() - 0.5) * 2 * Math.min(timingError, reset);

        if (isWaiting) {
            if (delta >= wait || skipped) {
                isWaiting = false;
                skipped = false;
                last = current;
                if (p < pLen - 1) {
                    textInput.text = "";
                }
                if (p < pLen) {
                    letters = paragraph[p].split("");
                    l = 0;
                }
            }
            return;
        }

        if (misspelled && delta >= backspaceTime * 0.01) {
            textInput.text = textInput.text.slice(0, -1);
            misspelled = false;
            last = current;
            return;
        }

        if (delta >= (reset - noise) * 0.01 && l < lLen) {
            if (Math.random() < spellErrorChance && !misspelled) {
                spellError = String.fromCharCode(
                    97 + Math.floor(Math.random() * 26)
                );
                textInput.text += spellError;
                misspelled = true;
            } else if (!misspelled) {
                textInput.text += letters[l];

                if (typeof callbackByType === "function") {
                    callbackByType();
                }

                l++;
                last = current;
            }
        }

        if (l >= lLen) {
            if (recover && p < pLen - 1) {
                textInput.text += splitter;
            }
            
            if (typeof callbackBySplitter === "function") {
                callbackBySplitter();
            }
            
            p++;
            isWaiting = true;
            last = current;
        }

        if (p >= pLen) {
            if (clearAtEnd) {
                textInput.text = clearedText;
            }
            if (userEvent) {
                script.removeEvent(userEvent);
            }
            if (killEvent) {
                script.removeEvent(userEvent);
            }
                                
            if (typeof callback === "function") {
                callback();
            }

            script.removeEvent(update);
        }
    });
}

/**
 * Flattens a hierarchical object structure into a flat map or array.
 *
 * If `result` is an object, the function creates a key-value map using the `name` property of each node.
 * If `result` is an array, the function pushes each node sequentially.
 *
 * @param {Object} parent - The root object of the hierarchy. Should have a `name` and `children` array.
 * @param {Object.<string, Object>|Object[]} [result={}] - The target object or array to accumulate results into.
 * @returns {Object.<string, Object>|Object[]} The flattened hierarchy as a map or array.
 *
 * @example
 * const tree = {
 *   name: "root",
 *   children: [
 *     { name: "child1", children: [] },
 *     { name: "child2", children: [] }
 *   ]
 * };
 * 
 * const flat = flattenObjectHierarchy(tree); // Returns { root: {...}, child1: {...}, child2: {...} }
 */
function flattenObjectHierarchy(parent, result = {}) {
    if(typeof result === "object" && result !== null && !Array.isArray(result)) {
        result[parent.name] = parent;
    } else {
        result.push(parent);
    }

    for (const child of parent.children) {
        flattenObjectHierarchy(child, result);
    }

    return result;
}

/**
 * Creates a wrapper function that ensures the wrapped function is called only once.
 * Subsequent calls return undefined until the wrapper is reset.
 *
 * @template {any[]} TArgs
 * @template TResult
 * @param {(...args: TArgs) => TResult} fn - The function to call only once.
 * @returns {((...args: TArgs) => TResult | undefined) & { reset: () => void }}
 */
function singleCall(fn) {
    let called = false;

    function wrapper(...args) {
        if (!called) {
            called = true;
            return fn.apply(this, args);
        }
    }

    wrapper.reset = () => {
        called = false;
    };

    return wrapper;
}

/**
 * Converts a 6-digit (#RRGGBB) or 4-digit (#RGBA) hex color string
 * into a normalized vec3 or vec4 color vector.
 *
 * @param {string} [hex=""] - The hex color string. May start with '#'.
 * @param {boolean} [inVec4=true] - Whether to return a vec4 (RGBA) or vec3 (RGB). If alpha is not given, defaults to 1.
 * @returns {vec3|vec4} The normalized color vector with components in [0, 1].
 *                      Returns magenta (1, 0, 1) or (1, 0, 1, 1) on invalid input.
 *
 * @example
 * convertHex("#FF8800");       // → vec4(1, 0.533, 0, 1)
 * convertHex("3366CC", false); // → vec3(0.2, 0.4, 0.8)
 * convertHex("#F8C4", true);   // → vec4(1, 0.533, 0.8, 0.266)
 * convertHex("HEX");        // → vec4(1, 0, 1, 1) with error printed
 */
function convertHex(hex = "", inVec4 = true) {
    if (hex.startsWith("#")) {
        hex = hex.slice(1);
    }

    if (hex.length === 6) {
        const r = parseInt(hex.slice(0, 2), 16) / 255;
        const g = parseInt(hex.slice(2, 4), 16) / 255;
        const b = parseInt(hex.slice(4, 6), 16) / 255;
        return inVec4 ? new vec4(r, g, b, 1) : new vec3(r, g, b);
    }

    if (hex.length === 4) {
        const r = parseInt(hex[0] + hex[0], 16) / 255;
        const g = parseInt(hex[1] + hex[1], 16) / 255;
        const b = parseInt(hex[2] + hex[2], 16) / 255;
        const a = parseInt(hex[3] + hex[3], 16) / 255;
        return inVec4 ? new vec4(r, g, b, a) : new vec3(r, g, b);
    }

    print(`Error: invalid hex "${hex}"`);
    return inVec4 ? new vec4(1, 0, 1, 1) : new vec3(1, 0, 1);
}
//#endregion

//#region <SOGT CLASS>
/**
 * A function that takes a number `k` from 0 to 1 and returns an eased number.
 * @callback EaseFunction
 * @param {number} k - A number between 0 and 1.
 * @returns {number} - Eased output.
 */

/**
 * Easing function group with `In`, `Out`, and `InOut` variants.
 * @typedef {Object} EaseGroup
 * @property {EaseFunction} [In]
 * @property {EaseFunction} [Out]
 * @property {EaseFunction} [InOut]
 */

/**
 * Collection of easing functions for interpolation.
 * @namespace
 * @property {EaseGroup} Linear
 * @property {EaseGroup} Quadratic
 * @property {EaseGroup} Cubic
 * @property {EaseGroup} Quartic
 * @property {EaseGroup} Quintic
 * @property {EaseGroup} Sinusoidal
 * @property {EaseGroup} Exponential
 * @property {EaseGroup} Circular
 * @property {EaseGroup} Elastic
 * @property {EaseGroup} Back
 * @property {EaseGroup} Bounce
 */

const EasingFunctions = {
    Linear: {
        InOut: function (k) {
            return k;
        },
    },
    Quadratic: {
        In: function (k) {
            return k * k;
        },
        Out: function (k) {
            return k * (2 - k);
        },
        InOut: function (k) {
            if ((k *= 2) < 1) {
                return 0.5 * k * k;
            }
            return -0.5 * (--k * (k - 2) - 1);
        },
    },
    Cubic: {
        In: function (k) {
            return k * k * k;
        },
        Out: function (k) {
            return --k * k * k + 1;
        },
        InOut: function (k) {
            if ((k *= 2) < 1) {
                return 0.5 * k * k * k;
            }
            return 0.5 * ((k -= 2) * k * k + 2);
        },
    },
    Quartic: {
        In: function (k) {
            return k * k * k * k;
        },
        Out: function (k) {
            return 1 - --k * k * k * k;
        },
        InOut: function (k) {
            if ((k *= 2) < 1) {
                return 0.5 * k * k * k * k;
            }
            return -0.5 * ((k -= 2) * k * k * k - 2);
        },
    },
    Quintic: {
        In: function (k) {
            return k * k * k * k * k;
        },
        Out: function (k) {
            return --k * k * k * k * k + 1;
        },
        InOut: function (k) {
            if ((k *= 2) < 1) {
                return 0.5 * k * k * k * k * k;
            }
            return 0.5 * ((k -= 2) * k * k * k * k + 2);
        },
    },
    Sinusoidal: {
        In: function (k) {
            return 1 - Math.cos((k * Math.PI) / 2);
        },
        Out: function (k) {
            return Math.sin((k * Math.PI) / 2);
        },
        InOut: function (k) {
            return 0.5 * (1 - Math.cos(Math.PI * k));
        },
    },
    Exponential: {
        In: function (k) {
            return k == 0 ? 0 : Math.pow(1024, k - 1);
        },
        Out: function (k) {
            return k == 1 ? 1 : 1 - Math.pow(2, -10 * k);
        },
        InOut: function (k) {
            if (k == 0) {
                return 0;
            }
            if (k == 1) {
                return 1;
            }
            if ((k *= 2) < 1) {
                return 0.5 * Math.pow(1024, k - 1);
            }
            return 0.5 * (-Math.pow(2, -10 * (k - 1)) + 2);
        },
    },
    Circular: {
        In: function (k) {
            return 1 - Math.sqrt(1 - k * k);
        },
        Out: function (k) {
            return Math.sqrt(1 - --k * k);
        },
        InOut: function (k) {
            if ((k *= 2) < 1) {
                return -0.5 * (Math.sqrt(1 - k * k) - 1);
            }
            return 0.5 * (Math.sqrt(1 - (k -= 2) * k) + 1);
        },
    },
    Elastic: {
        In: function (k) {
            if (k == 0) {
                return 0;
            }
            if (k == 1) {
                return 1;
            }
            return (
                -Math.pow(2, 10 * (k - 1)) *
                Math.sin((k - 1.1) * 5 * Math.PI)
            );
        },
        Out: function (k) {
            if (k == 0) {
                return 0;
            }
            if (k == 1) {
                return 1;
            }
            return (
                Math.pow(2, -10 * k) *
                    Math.sin((k - 0.1) * 5 * Math.PI) +
                1
            );
        },
        InOut: function (k) {
            if (k == 0) {
                return 0;
            }
            if (k == 1) {
                return 1;
            }
            k *= 2;
            if (k < 1) {
                return (
                    -0.5 *
                    Math.pow(2, 10 * (k - 1)) *
                    Math.sin((k - 1.1) * 5 * Math.PI)
                );
            }
            return (
                0.5 *
                    Math.pow(2, -10 * (k - 1)) *
                    Math.sin((k - 1.1) * 5 * Math.PI) +
                1
            );
        },
    },
    Back: {
        In: function (k) {
            var s = 1.70158;
            return k * k * ((s + 1) * k - s);
        },
        Out: function (k) {
            var s = 1.70158;
            return --k * k * ((s + 1) * k + s) + 1;
        },
        InOut: function (k) {
            var s = 1.70158 * 1.525;
            if ((k *= 2) < 1) {
                return 0.5 * (k * k * ((s + 1) * k - s));
            }
            return 0.5 * ((k -= 2) * k * ((s + 1) * k + s) + 2);
        },
    },
    Bounce: {
        In: function (k) {
            return 1 - Bounce(1 - k);
        },
        Out: function (k) {
            return Bounce(k)
        },
        InOut: function (k) {
            if (k < 0.5) {
                return Bounce(k * 2) * 0.5;
            }
            return Bounce(k * 2 - 1) * 0.5 + 0.5;
        },
    },
};

function Bounce (k) {
    if (k < 1 / 2.75) {
        return 7.5625 * k * k;
    } else if (k < 2 / 2.75) {
        return 7.5625 * (k -= 1.5 / 2.75) * k + 0.75;
    } else if (k < 2.5 / 2.75) {
        return 7.5625 * (k -= 2.25 / 2.75) * k + 0.9375;
    } else {
        return 7.5625 * (k -= 2.625 / 2.75) * k + 0.984375;
    }
}; 

//
/** @private */ const time = Symbol("time");
/** @private */ const flow = Symbol("flow");
/** @private */ const cycle = Symbol("cycle");
/** @private */ const loopSymbol = Symbol("loop");
/** @private */ const progressionSymbol = Symbol("progression");
/** @private */ const isPausedSymbol = Symbol("isPaused");
/** @private */ const isReversedSymbol = Symbol("isReversed");

/** @private */ const cycleCallbackCalled = Symbol("cycle");
/** @private */ const animCallbackCalled = Symbol("cycle");

/**
 * @module SOGT
 */

/**
 * Tweening controller supporting loops, ping-pong, and easing.
 * @class
 */
class SOGT{
    /** @constructor */
    constructor(){
        this[time] = 0;
        this[flow] = 1;
        this[cycle] = 0;
        this[loopSymbol] = 1;
        this[progressionSymbol] = 0;
        this[isPausedSymbol] = false;
        this[isReversedSymbol] = false;

        this[cycleCallbackCalled] = false;
        this[animCallbackCalled] = false;

        /**
         * @readonly
         * @type {number}
         */
        this.cycleIndex = 0;
        /**
         * @readonly
         * @type {number}
         */
        this.progression = 0;
        /**
         * @readonly
         * @type {boolean}
         */
        this.isPaused = false;
        /**
         * @readonly
         * @type {boolean}
         */
        this.isReversed = false;
        
        /** @type {number} */
        this.duration = 1;
        /**
         * The easing function applied to progression.
         * Replace with any function from `EasingFunctions`.
         * 
         * @example
         * anim.easeFunction = EasingFunctions.Quadratic.InOut;
         * 
         * @type {EaseFunction}
         */
        this.easeFunction = EasingFunctions.Linear.InOut;
        /** @type {number} */
        this.loop = 1;
        /** @type {boolean} */
        this.pingpong = false;
        
        Object.defineProperty(this, "loop", {
            get(){
                return this[loopSymbol];
            },
            set(loopCount){
                this[loopSymbol] = loopCount < 1 ? Infinity : loopCount;
            }
        })

        Object.defineProperty(this, "cycleIndex", {
            get(){
                return this[cycle];
            },
        })

        Object.defineProperty(this, "progression", {
            get(){
                return this[progressionSymbol];
            },
        })

        Object.defineProperty(this, "isPaused", {
            get(){
                return this[isPausedSymbol];
            },
        })

        Object.defineProperty(this, "isReversed", {
            get(){
                return this[isReversedSymbol];
            },
        })
    }

    /**
     * Advances the animation based on time delta.
     * Handles easing, looping, ping-pong, and calls appropriate callbacks.
     * 
     * @param {Object} [options] - Play control options.
     * @param {function(): void} [options.cycleCallback] - Called at the end of each loop cycle.
     * @param {function(): void} [options.callback] - Called when all cycles finish.
     * @param {EaseFunction} [options.easeFunction] - Overrides current ease function for this play call.
     * @returns {number} - Eased progression from 0 to 1.
     */
    play({
        cycleCallback = function(){},
        callback = function(){},
        easeFunction = null,
    } = {}){
        this[time] = MathUtils.clamp(this[time] + this[flow] * (this[isPausedSymbol] ? 0 : 1) * getDeltaTime(), 0, this.duration);
        this[progressionSymbol] = MathUtils.clamp(this[time] / this.duration, 0, 1);

        const forwardComplete = this[progressionSymbol] === 1;
        const reverseComplete = this[flow] < 0 && this[progressionSymbol] === 0;

        if(forwardComplete || reverseComplete) {
            if(this[cycle] < this[loopSymbol]) this[cycle] += 1;

            this[time] = this[loopSymbol] === 0 || this[cycle] >= this[loopSymbol]
                ? (reverseComplete ? 0 : this.duration)
                : (reverseComplete ? this.duration : 0);


            // Callbacks
            if (!this[cycleCallbackCalled] && this[loopSymbol] !== 1) {
                this[cycleCallbackCalled] = true;
                cycleCallback();
            }

            if (!this[animCallbackCalled] && this[cycle] >= this[loopSymbol]) {
                this[animCallbackCalled] = true;
                callback();
            }

            if(this[cycle] < this[loopSymbol]) {
                this[cycleCallbackCalled] = false;
            }
        }

        let progress = this[progressionSymbol];

        if(this.pingpong && this[cycle] % 2 !== 0){
            progress = 1 - this[progressionSymbol];
        }

        if(easeFunction) this.easeFunction = easeFunction; 

        return this.easeFunction(progress);
    }

    /**
     * Toggles the paused state of the animation timer.
     */
    pauseResume() {
        this[isPausedSymbol] = !this[isPausedSymbol];
    }

    /**
     * Reset the timer to the initial state.
     */
    reset() {
        this[time] = 0;
        this[flow] = 1;
        this[cycle] = 0;
        this[isPausedSymbol] = false;

        this[animCallbackCalled] = false;
        this[cycleCallbackCalled] = false;
    }

    /**
     * Reverse the direction of the timer.
     */
    reverse(){
        this[flow] = -this[flow];
        this[isReversedSymbol] = this[flow] < 0;

        this[animCallbackCalled] = false;
        this[cycleCallbackCalled] = false;
    }
}

//#endregion


//
const BatchUtils = {
    writeAttributes,
    createBatchSceneObject,
    batchExecute,
}

const QuickUtils = {
    delayedCall,
    deepCopyObject,
    flattenObjectHierarchy,
    convertHex,
    typewriter,
    singleCall,
}

const CustomTween = {
    EasingFunctions,
    SOGT
}

module.exports = {
    BatchUtils,
    QuickUtils,
    CustomTween,
}
