# Liqmo Glass Basic Button 

### Overview

**Liqmo Glass** is a shader-driven UI component that renders a configurable glass-like button. It lets you compose buttons, menus, sliders and switches to fit your UI, designed as semi-modular primitives rather than fixed widgets.

**Liqmo Glass Basic Button** is one of the Liqmo Glass modules — it performs standard button functions while rendering a glass-like appearance. Used with **Liqmo Glass Selector**, it can be composed into menus, sliders, and switches.

**Liqmo Glass Morph Button** is an expandable button module that can pop a child button while rendering a glass-like appearance. 

**Liqmo Glass Selector** acts as a menu highlighter and actuator for sliders/switches, providing a glass-like visual cue for selection and positioning when combined with **Liqmo Glass Basic Button**.

[LiqmoGlass @c4205M](https://github.com/c4205m/LiqmoGlass)

### Parameters

##### Glass Settings

<div style="font-size: 10px">
    <sup>1</sup> When '0', material won't calculate for glass
    </br>
    <sup>2</sup> Alpha controls overall opacity of the button
    </br>
    <sup>3</sup> Higher values may impact performance
</div>

| Input Name | Parameter | Type | Range | Description |
|---|---|---|---|---|
| Thickness | `thickness` | `float` | 0 < x | Thickness of the glass material |
| Frost | `frost` | `float` | 0 < x | Frostiness of the glass material |
| Transparency | `transparency` | `float` | 0 - 1 | Transparency of the glass material<sup>1</sup> |
| Material | `material` | `float` | 0 - 1 | Cleanness of the glass material |
| Use Texture | `useTex` | `boolean` | true/false | Applies texture when true |
| Color Tint | `baseColor` | `vec4` | 0 - 1 | Adds color for tinted glass effect<sup>2</sup> |
| Texture | `extraTex` | `Asset.Texture` | - | Apply texture instead of color tint |
| Flat Lighting | `topLighting` | `boolean` |true/false | Edge light angle from above |
| Light Angle | `lightAngle` | `float` | 0 - 360 | Edge light angle |
| Light Bleed | `bleed` | `float` | 0 < x | Edge light bleed amount |
| Chromatic Aberration | `chromaticAbbr` | `float` | 0 < x | Chromatic aberration strength<sup>3</sup> |
| On Surface | `chromaticAbbrOnSurface` | `boolean` | true/false |Controls whether chromatic aberration appears across the surface or only edges <sup>3</sup> |
| Render Quality | `quality` | `float` | 0 < x | Glass render quality<sup>3</sup> |

##### Shape Settings

| Input Name | Parameter | Type | Range | Description |
|---|---|---|---|---|
| Shape Scale | `shapeScale` | `vec2` | 0 < x | Button scale |
| Shape Position | `shapePosition` | `vec2` | - | Button position |
| Shape Softness | `shapeSoftness` | `float` | 0 - 1 | Edge softness |
| Corner Radius | `cornerRadius` | `vec4` | 0 - 1| Roundness of the corners |

##### Icon Settings

<div style="font-size: 10px">
    <sup>1</sup> Packed textures are supported
</div>

| Input Name | Parameter | Type | Range | Description |
|---|---|---|---|---|
| Icon Set | `icon0` | `Asset.Texture` | - | Icon texture<sup>1</sup> |
| Icon Scale | `iconScale` | `vec2` | 0 < x | Icon scale |
| Icon Position | `iconPosition` | `vec2` | -| Icon position |
| Max Blur | `maxBlur` | `float` | 0 - 10 | Maximum blur amount when streched |
| Mono Color | `useColor` | `boolean` | true/false| When true, overwrites color info of icon texture with `iconColor` |
| Icon Color | `iconColor` | `vec3` | - | Icon color |
| Color Channnel | `colorChannel` | `int` | 0 - 3 | Controls the alpha channel of the icon |

##### Touch Settings
| Input Name | Parameter | Type | Range | Description |
|---|---|---|---|---|
| Stretch | `stretchStrength` | `float` | 0 - 1 | Stretch amount on touch move |
| Press | `pressDownStrength` | `float` | 0 - 1 | Squash amount on touch press |
| Nudge | `nudgeStrength` | `float` | 0 - 1 | Stretch amount on touch move |
| Show light on press | `pressLight` | `boolean` | true/false | Show light on press |
| Show light on hover | `hoverLight` | `boolean` | true/false | Show light on hover |
| Strecth every angle | `constantStretch` | `boolean` | true/false | Strecth every angle |

##### Interaction Settings
| Input Name | Parameter | Type | Range | Description |
|---|---|---|---|---|
| Debug On Screen | `debugOnScreen` | `boolean` | true/false | Enables visualizers for interactions |
| Add Interaction | - | `Array<InteractionSetup>` | - | Adds interactions for touch event |

"Add Interaction" is an array of InteractionSetup objects. Each object uses the fields from the Interaction Item table (id, groupId, scale, enabled, etc.) to register a touch/button area. Use unique ids for buttons, the same groupId to group them.

| Input Name | Parameter | Type | Range | Description |
|---|---|---|---|---|
| Id* | `id` | `string` | - | Button interaction id |
| Group Id* | `groupId` | `string` | - | Button interaction group id |
| Scale*  | `scale` | `vec2` | - | Size of the interaction area |
| Enabled*  | `enabled` | `boolean` | true/false | Whether interaction is active or not |

### API — quick reference

Use these methods to control the component at runtime.


```js
// Enable/disable a registered interaction by id
modifyInteraction(buttonId: string, visible: boolean = true)
// Example:
modifyInteraction("btn1", false)

// Enable/disable all interactions in a group
modifyInteractionGroup(groupId: string, visible: boolean = true)
// Example:
modifyInteractionGroup("groupA", true)

// Smoothly update shape settings (e.g., cornerRadius, shapeScale)
modifyShape(shapeSettings: Partial<ShapeSettings | MorphShapeSettings>)
// Example:
modifyShape({ cornerRadius: 0.2, shapeScale: vec2(0.5, 0.5) })

// Update icon settings
modifyIconSet(iconSettings: Partial<IconSettingsPlus>)
// Example:
modifyIconSet({ iconColor: vec3(1, 0.8, 0.2), icon0: newTex })

// Update glass settings
modifyGlass(glassSettings: Partial<GlassSettings>)
// Example:
modifyGlass({ transparency: 0.9, frost: 0.2 })

// Update touch/interaction response (stretch, press, nudge)
modifyTouch(touchSettings: Partial<TouchSettings>)
// Example:
modifyTouch({ pressDownStrength: 0.6 })

// Refer to the Parameters tables above for exact field names and valid ranges when calling these methods.

// Reset methods — restore configured defaults
resetShape()
resetIconSet()
resetGlass()
resetTouch()
```

Use TypeScript for better editor completions and safer calls — the Liqmo API is strongly-typed and you'll get autocomplete for methods, parameters, and customButtonFunctions.

```js
import {LiqmoBasicButton} from "./Liqmo Basic Button.lsc/Liqmo Basic Button"
import {LiqmoMorphButton} from "./Liqmo Basic Button.lsc/Liqmo Morph Button"

@component
export class NewScript extends BaseScriptComponent {
    @input("Component.ScriptComponent")
    BasicButton: LiqmoBasicButton

    @input("Component.ScriptComponent")
    MorphButton: LiqmoMorphButton
    onAwake() {
        //...
    }
}
```
