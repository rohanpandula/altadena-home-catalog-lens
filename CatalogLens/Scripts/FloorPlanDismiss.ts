/**
 * FloorPlanNav — Navigation controls for the floor plan detail view.
 *
 * Attach to the FloorPlanDisplay SceneObject.
 * Creates prev/next/back buttons and handles touch + pinch navigation.
 */
import { CatalogManager } from './CatalogManager'

@component
export class FloorPlanDismiss extends BaseScriptComponent {
  @input
  @hint('The CatalogManager script component')
  catalogManager: ScriptComponent

  @input
  @hint('SceneObject for the Prev button text')
  prevButton: SceneObject

  @input
  @hint('SceneObject for the Next button text')
  nextButton: SceneObject

  @input
  @hint('SceneObject for the Back button text')
  backButton: SceneObject

  private manager: CatalogManager | null = null

  onAwake(): void {
    this.createEvent('OnStartEvent').bind(() => this.onStart())
  }

  private onStart(): void {
    this.manager = this.catalogManager as unknown as CatalogManager

    if (!this.manager) {
      print('[FloorPlanNav] ERROR: CatalogManager not assigned')
      return
    }

    // Desktop: detect tap position to determine which button was hit
    this.createEvent('TouchStartEvent').bind((ev: TouchStartEvent) => {
      if (!this.sceneObject.enabled) return
      const pos = ev.getTouchPosition()
      // Left edge = prev, right edge = next, center = flip, bottom = back
      if (pos.y > 0.8) {
        this.manager!.dismissFloorPlan()
      } else if (pos.x < 0.25) {
        this.manager!.prevHouse()
      } else if (pos.x > 0.75) {
        this.manager!.nextHouse()
      } else {
        // Center tap = flip between elevation and floor plan
        this.manager!.flipCard()
      }
    })

    // Spectacles: use gestures
    try {
      const gestureModule = require('LensStudio:GestureModule') as GestureModule

      // Swipe-like: left hand pinch = prev, right hand pinch = next
      gestureModule
        .getPinchDownEvent(GestureModule.HandType.Left)
        .add(() => {
          if (this.sceneObject.enabled) {
            this.manager!.prevHouse()
          }
        })

      gestureModule
        .getPinchDownEvent(GestureModule.HandType.Right)
        .add(() => {
          if (this.sceneObject.enabled) {
            this.manager!.nextHouse()
          }
        })

      print('[FloorPlanNav] Gesture nav ready')
    } catch (e) {
      print('[FloorPlanNav] GestureModule not available (desktop mode)')
    }
  }
}
