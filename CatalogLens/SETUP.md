# Catalog Lens — Lens Studio Setup Guide

## Prerequisites
1. Lens Studio 5.x+
2. From Asset Library, add:
   - **Spectacles Interaction Kit** (SIK)
   - **Spectacles UI Kit** (UIKit)

## Assets to Import

### Textures (512x512 PNG each)
For each house, import two textures into the project:

| House | Elevation Render | Floor Plan |
|---|---|---|
| The Delaware | `elev_delaware.png` | `fp_delaware.png` |
| The Montana | `elev_montana.png` | `fp_montana.png` |
| La Paz | `elev_lapaz.png` | `fp_lapaz.png` |
| The Elderflower | `elev_elderflower.png` | `fp_elderflower.png` |
| The Lewis | `elev_lewis.png` | `fp_lewis.png` |
| La Mariposa | `elev_mariposa.png` | `fp_mariposa.png` |
| The Marlowe | `elev_marlowe.png` | `fp_marlowe.png` |
| Casita Blanca | `elev_casitablanca.png` | `fp_casitablanca.png` |
| The Elizabeth | `elev_elizabeth.png` | `fp_elizabeth.png` |
| The Gregory | `elev_gregory.png` | `fp_gregory.png` |
| The Figueroa I | `elev_figueroa1.png` | `fp_figueroa1.png` |
| The Monterey I | `elev_monterey1.png` | `fp_monterey1.png` |
| The Lexington | `elev_lexington.png` | `fp_lexington.png` |
| The Carmelina | `elev_carmelina.png` | `fp_carmelina.png` |
| The Cromwell | `elev_cromwell.png` | `fp_cromwell.png` |
| The Maybrook | `elev_maybrook.png` | `fp_maybrook.png` |
| The Charmant | `elev_charmant.png` | `fp_charmant.png` |

Set all textures to **Performance** compression and enable **Mipmaps**.

### Materials
- Create one **Unlit** material named `FloorPlanMat` (no lighting needed)

### Meshes
- Add a **Plane** mesh from Lens Studio's built-in library

## Scene Hierarchy

Build this in the Scene panel:

```
Scene Root
├── Camera (default)
├── SpectaclesInteractionKit (from Asset Library)
│
├── CatalogRoot                          [empty SceneObject]
│   └── [Attach: CatalogManager.ts]
│
├── CardStripFrame                       [empty SceneObject]
│   └── ScrollView                       [Add SIK ScrollView component]
│       └── ScrollContent                [empty SceneObject]
│           └── [Attach: CardStripBuilder.ts]
│
├── FloorPlanDisplay                     [empty SceneObject, starts DISABLED]
│   ├── FloorPlanQuad                    [Add: RenderMeshVisual → Plane mesh + FloorPlanMat]
│   ├── FloorPlanTitleText               [Add: Component.Text]
│   └── DismissZone                      [empty SceneObject]
│       └── [Attach: FloorPlanDismiss.ts]
```

## Wiring Up Inspector Inputs

### CatalogManager (on CatalogRoot)
| Field | Drag From |
|---|---|
| `elevationTextures` | All 17 elevation textures, in order matching HouseData.ts |
| `floorPlanTextures` | All 17 floor plan textures, in same order |
| `cardStripRoot` | → CardStripFrame |
| `floorPlanDisplay` | → FloorPlanDisplay |
| `floorPlanMesh` | → FloorPlanQuad's RenderMeshVisual |
| `floorPlanTitle` | → FloorPlanTitleText's Text component |

### CardStripBuilder (on ScrollContent)
| Field | Drag From |
|---|---|
| `catalogManager` | → CatalogRoot (the script component) |

### FloorPlanDismiss (on DismissZone)
| Field | Drag From |
|---|---|
| `catalogManager` | → CatalogRoot (the script component) |

## ScrollView Configuration
1. Select the **ScrollView** SceneObject
2. In the SIK ScrollView component:
   - Set scroll direction to **Horizontal**
   - Content container → **ScrollContent**

## FloorPlanDisplay Positioning
- Position FloorPlanDisplay at `(0, 0, -100)` (1 meter in front of the camera, at the focus plane)
- Scale the FloorPlanQuad to an appropriate viewing size, e.g. `(30, 30, 1)`

## Testing
- **Desktop Preview**: UI layout and card building will work. Hand tracking and ScrollView require on-device testing.
- **On-Device**: Push to Spectacles via Lens Studio. Test hand swipe scrolling and pinch selection.
