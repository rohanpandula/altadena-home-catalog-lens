/**
 * CatalogManager — Main orchestration script for the Catalog Lens.
 *
 * Attach to a root-level SceneObject. Drag elevation + floor plan textures
 * into the inspector arrays (same order as HOUSE_CATALOG in HouseData.ts).
 */
import { HouseInfo, HOUSE_CATALOG } from './HouseData'

@component
export class CatalogManager extends BaseScriptComponent {
  // --- Inspector inputs ---
  @input
  @hint('Elevation render textures — one per house, same order as HouseData.ts')
  elevationTextures: Texture[]

  @input
  @hint('Floor plan textures — one per house, same order as HouseData.ts')
  floorPlanTextures: Texture[]

  @input
  @hint('The card strip root SceneObject (Frame)')
  cardStripRoot: SceneObject

  @input
  @hint('The floor plan display SceneObject (starts disabled)')
  floorPlanDisplay: SceneObject

  @input
  @hint('The RenderMeshVisual on the floor plan quad')
  floorPlanMesh: RenderMeshVisual

  @input
  @hint('Text component showing the selected house name')
  floorPlanTitle: Text

  @input
  @hint('Text component showing house details (sqft, beds, baths)')
  floorPlanDetails: Text

  @input
  @hint('Text component showing "X of Y" counter')
  floorPlanCounter: Text

  // --- State ---
  private houses: HouseInfo[] = []
  private selectedIndex: number = -1
  private floorPlanMaterial: Material | null = null
  private showingFloorPlan: boolean = false
  private isFlipping: boolean = false

  onAwake(): void {
    this.createEvent('OnStartEvent').bind(() => this.onStart())
  }

  private onStart(): void {
    // Build the house info array
    for (let i = 0; i < HOUSE_CATALOG.length; i++) {
      const entry = HOUSE_CATALOG[i]
      this.houses.push({
        id: entry.name.toLowerCase().replace(/\s+/g, '_'),
        name: entry.name,
        sqft: entry.sqft,
        beds: entry.beds,
        baths: entry.baths,
        elevationTexture: this.elevationTextures[i],
        floorPlanTexture: this.floorPlanTextures[i],
      })
    }

    // Clone the floor plan material once so we can swap textures safely
    if (this.floorPlanMesh) {
      this.floorPlanMaterial = this.floorPlanMesh.mainMaterial.clone()
      this.floorPlanMesh.mainMaterial = this.floorPlanMaterial
    }

    // Start with floor plan hidden
    if (this.floorPlanDisplay) {
      this.floorPlanDisplay.enabled = false
    }

    print('[CatalogManager] Initialized with ' + this.houses.length + ' houses')
  }

  // --- Public API ---

  getHouses(): HouseInfo[] {
    return this.houses
  }

  getHouseCount(): number {
    return this.houses.length
  }

  getSelectedIndex(): number {
    return this.selectedIndex
  }

  selectHouse(index: number): void {
    if (index < 0 || index >= this.houses.length) return

    this.selectedIndex = index
    const house = this.houses[index]
    print('[CatalogManager] Selected: ' + house.name)

    // Show elevation first
    this.showingFloorPlan = false
    if (this.floorPlanDisplay && this.floorPlanMaterial) {
      this.floorPlanMaterial.mainPass.baseTex = house.elevationTexture
      this.floorPlanDisplay.enabled = true

      // Set title
      if (this.floorPlanTitle) {
        this.floorPlanTitle.text = house.name
      }

      // Set details
      if (this.floorPlanDetails) {
        this.floorPlanDetails.text =
          house.sqft + ' sq ft  •  ' + house.beds + ' bed / ' + house.baths + ' bath'
      }

      // Set counter
      if (this.floorPlanCounter) {
        this.floorPlanCounter.text =
          (index + 1) + ' of ' + this.houses.length
      }

      // Animate scale in
      const transform = this.floorPlanDisplay.getTransform()
      transform.setLocalScale(new vec3(0.01, 0.01, 0.01))
      this.animateScale(transform, vec3.one(), 0.4)
    }

    // Hide card strip
    if (this.cardStripRoot) {
      this.cardStripRoot.enabled = false
    }
  }

  nextHouse(): void {
    if (this.selectedIndex < 0) return
    const next = (this.selectedIndex + 1) % this.houses.length
    this.selectHouse(next)
  }

  prevHouse(): void {
    if (this.selectedIndex < 0) return
    const prev =
      (this.selectedIndex - 1 + this.houses.length) % this.houses.length
    this.selectHouse(prev)
  }

  dismissFloorPlan(): void {
    if (!this.floorPlanDisplay) return

    const transform = this.floorPlanDisplay.getTransform()
    this.animateScale(transform, new vec3(0.01, 0.01, 0.01), 0.3, () => {
      this.floorPlanDisplay.enabled = false
    })

    // Re-show card strip
    if (this.cardStripRoot) {
      this.cardStripRoot.enabled = true
    }

    this.selectedIndex = -1
  }

  flipCard(): void {
    if (this.selectedIndex < 0 || this.isFlipping) return
    if (!this.floorPlanDisplay || !this.floorPlanMaterial) return

    const house = this.houses[this.selectedIndex]
    this.isFlipping = true

    const quadObj = this.floorPlanMesh!.getSceneObject()
    const transform = quadObj.getTransform()
    const baseScale = transform.getLocalScale()

    // Phase 1: scale X to 0 (card edge-on)
    this.animateValue(0, 1, 0.2, (t: number) => {
      const eased = t * t
      const scaleX = baseScale.x * (1 - eased)
      transform.setLocalScale(new vec3(scaleX, baseScale.y, baseScale.z))
    }, () => {
      // Swap texture at midpoint
      this.showingFloorPlan = !this.showingFloorPlan
      this.floorPlanMaterial!.mainPass.baseTex = this.showingFloorPlan
        ? house.floorPlanTexture
        : house.elevationTexture

      // Phase 2: scale X back to full
      this.animateValue(0, 1, 0.2, (t: number) => {
        const eased = 1 - (1 - t) * (1 - t)
        const scaleX = baseScale.x * eased
        transform.setLocalScale(new vec3(scaleX, baseScale.y, baseScale.z))
      }, () => {
        transform.setLocalScale(baseScale)
        this.isFlipping = false
      })
    })
  }

  isShowingFloorPlan(): boolean {
    return this.showingFloorPlan
  }

  private animateValue(
    from: number,
    to: number,
    duration: number,
    onUpdate: (t: number) => void,
    onComplete?: () => void
  ): void {
    let elapsed = 0
    const evt = this.createEvent('UpdateEvent')
    evt.bind(() => {
      elapsed += getDeltaTime()
      const t = Math.min(elapsed / duration, 1.0)
      onUpdate(t)
      if (t >= 1.0) {
        evt.enabled = false
        if (onComplete) onComplete()
      }
    })
  }

  private animateScale(
    transform: Transform,
    target: vec3,
    duration: number,
    onComplete?: () => void
  ): void {
    const start = transform.getLocalScale()
    let elapsed = 0
    const evt = this.createEvent('UpdateEvent')
    evt.bind(() => {
      elapsed += getDeltaTime()
      const t = Math.min(elapsed / duration, 1.0)
      const eased = t * (2 - t) // ease-out quad
      transform.setLocalScale(vec3.lerp(start, target, eased))
      if (t >= 1.0) {
        evt.enabled = false
        if (onComplete) onComplete()
      }
    })
  }
}
