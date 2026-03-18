# Altadena Home Catalog — Snap Spectacles Lens

A Snap Spectacles AR lens that lets you browse the [Foothill Catalog Foundation's](https://www.foothillcatalog.org/) pre-approved home designs for Altadena wildfire rebuild. Scroll through 17 house designs, view exterior renderings, and flip to see floor plans — all in AR.

## What It Does

- **Horizontal scroll strip** of house cards floating in front of you, each showing the exterior rendering and house name
- **Tap/pinch a card** to select it and enter detail view
- **Flip animation** toggles between the exterior rendering and the floor plan (tap center of the card)
- **Prev/Next navigation** to browse through houses without going back to the scroll view
- **House details** displayed below each card: square footage, bedrooms, and bathrooms

## Houses Included

All 17 pre-approved single-family home designs from the Altadena catalog:

| # | House | Sq Ft | Beds | Baths |
|---|-------|-------|------|-------|
| 1 | The Delaware | 975 | 3 | 1 |
| 2 | The Montana | 975 | 3 | 1 |
| 3 | La Paz | 976 | 2 | 2 |
| 4 | The Elderflower | 1,075 | 2 | 2 |
| 5 | The Lewis | 1,259 | 3 | 2 |
| 6 | La Mariposa | 1,289 | 3 | 2 |
| 7 | The Marlowe | 1,290 | 2 | 2 |
| 8 | Casita Blanca | 1,580 | 3 | 2 |
| 9 | The Elizabeth | 1,600 | 3 | 2 |
| 10 | The Gregory | 1,600 | 3 | 2 |
| 11 | The Figueroa I | 1,708 | 3 | 2.5 |
| 12 | The Monterey I | 1,708 | 3 | 2.5 |
| 13 | The Lexington | 1,722 | 3 | 2 |
| 14 | The Carmelina | 1,960 | 4 | 2.5 |
| 15 | The Cromwell | 1,960 | 4 | 2.5 |
| 16 | The Maybrook | 1,960 | 4 | 2.5 |
| 17 | The Charmant | 1,960 | 4 | 2.5 |

## How It Was Built

This lens was built almost entirely through a conversation with **Claude Code** (Anthropic's AI coding agent), connected to **Lens Studio** via its MCP (Model Context Protocol) developer mode.

### The workflow:

1. **Ideation** — Brainstormed AR lens concepts for displaying the housing catalog, settled on a horizontal scroll picker with detail view
2. **Image sourcing** — Claude scraped all 17 house elevation renderings and floor plan images from [foothillcatalog.org](https://www.foothillcatalog.org/the-catalog/altadena) using `curl` and compressed them with ImageMagick to fit under Snap's 8MB lens size limit
3. **Scene building** — Claude created and configured the entire Lens Studio scene graph via MCP: scene objects, materials (UberUnlit), texture wiring, component properties, and hierarchy
4. **Scripting** — TypeScript components for:
   - `HouseData.ts` — House catalog data (names, specs)
   - `CatalogManager.ts` — Main orchestration, card flip animation, navigation
   - `CardStripBuilder.ts` — Programmatic horizontal card strip with raycasting tap detection
   - `FloorPlanDismiss.ts` — Navigation controls (prev/next/back) with gesture + touch support
5. **Debugging** — Claude read runtime logs via MCP, fixed texture wiring (null slots), resolved the `MotionController` SIK error by removing the MobileInteractor, and iteratively compressed assets to meet size limits

### Tech stack:
- **Lens Studio 5.x** with Spectacles Interaction Kit (SIK) + UI Kit
- **TypeScript** scripting with `@component`/`@input` decorators
- **Snap MCP** for AI-driven scene manipulation
- **Claude Code** as the development agent

## Project Structure

```
CatalogLens/
  Scripts/
    HouseData.ts          # House names, sqft, beds, baths
    CatalogManager.ts     # Main controller, flip animation, nav
    CardStripBuilder.ts   # Builds horizontal scroll card strip
    FloorPlanDismiss.ts   # Detail view navigation controls

AltadenaHousesSpecs/      # Lens Studio project
  Assets/
    Textures/
      Houses/             # 17 elevation rendering images (256x256 JPG)
      FloorPlans/         # 17 floor plan images (256x256 JPG)
    Scripts/              # Compiled scripts (copied from CatalogLens)
```

## Setup

1. Open `AltadenaHousesSpecs/AltadenaHousesSpecs.esproj` in Lens Studio 5.x+
2. Install **Spectacles Interaction Kit** and **Spectacles UI Kit** from the Asset Library
3. See `CatalogLens/SETUP.md` for scene hierarchy and inspector wiring details

## Credits

- Home designs and images from [The Foothill Catalog Foundation](https://www.foothillcatalog.org/)
- Built with [Lens Studio](https://developers.snap.com/lens-studio) by Snap Inc.
- Development assisted by [Claude Code](https://claude.ai/claude-code) (Anthropic)
