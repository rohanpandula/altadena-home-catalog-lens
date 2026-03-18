/**
 * CardStripBuilder — Builds the horizontal scrollable card strip.
 *
 * Attach to the ScrollView content container SceneObject.
 * Programmatically creates one card per house with an elevation image and name label.
 * Uses colliders + global pinch/tap detection to select cards.
 */
import { CatalogManager } from './CatalogManager'

@component
export class CardStripBuilder extends BaseScriptComponent {
  @input
  @hint('The CatalogManager script component')
  catalogManager: ScriptComponent

  @input
  @hint('Unlit material to clone for card images')
  cardMaterial: Material

  @input
  @hint('Plane mesh for card images')
  cardMesh: RenderMesh

  @input
  @hint('Camera SceneObject for raycasting')
  cameraObject: SceneObject

  // Card dimensions in world units
  private readonly CARD_WIDTH: number = 8
  private readonly CARD_HEIGHT: number = 6
  private readonly CARD_SPACING: number = 2
  private readonly IMAGE_SIZE: number = 5

  private manager: CatalogManager | null = null
  private cardObjects: SceneObject[] = []

  onAwake(): void {
    this.createEvent('OnStartEvent').bind(() => this.onStart())
  }

  private onStart(): void {
    this.manager = this.catalogManager as unknown as CatalogManager

    if (!this.manager) {
      print('[CardStripBuilder] ERROR: CatalogManager not assigned')
      return
    }

    if (!this.cardMaterial) {
      print('[CardStripBuilder] ERROR: cardMaterial not assigned')
      return
    }

    if (!this.cardMesh) {
      print('[CardStripBuilder] ERROR: cardMesh not assigned')
      return
    }

    // Wait a frame for CatalogManager to initialize
    const delay = this.createEvent('DelayedCallbackEvent')
    delay.bind(() => {
      this.buildCards()
      this.setupInteraction()
    })
    delay.reset(0.3)
  }

  private buildCards(): void {
    const houses = this.manager!.getHouses()
    print('[CardStripBuilder] Building ' + houses.length + ' cards')

    for (let i = 0; i < houses.length; i++) {
      const house = houses[i]

      // Create card container
      const cardObj = global.scene.createSceneObject('Card_' + house.id)
      cardObj.setParent(this.sceneObject)

      // Position horizontally
      const xPos = i * (this.CARD_WIDTH + this.CARD_SPACING)
      cardObj.getTransform().setLocalPosition(new vec3(xPos, 0, 0))

      // --- Elevation image using RenderMeshVisual + cloned material ---
      const imageObj = global.scene.createSceneObject('ElevImg_' + house.id)
      imageObj.setParent(cardObj)
      imageObj.getTransform().setLocalPosition(new vec3(0, 1.0, 0))
      imageObj.getTransform().setLocalScale(
        new vec3(this.IMAGE_SIZE, this.IMAGE_SIZE * 0.75, 1)
      )

      const rmv = imageObj.createComponent(
        'Component.RenderMeshVisual'
      ) as RenderMeshVisual
      rmv.mesh = this.cardMesh

      // Clone material so each card gets its own texture
      const mat = this.cardMaterial.clone()
      if (house.elevationTexture) {
        mat.mainPass.baseTex = house.elevationTexture
      }
      rmv.mainMaterial = mat

      // --- House name label ---
      const textObj = global.scene.createSceneObject('Name_' + house.id)
      textObj.setParent(cardObj)
      textObj.getTransform().setLocalPosition(
        new vec3(0, -(this.IMAGE_SIZE * 0.5 + 0.5), 0)
      )

      const text = textObj.createComponent('Component.Text') as Text
      text.text = house.name
      text.size = 10
      text.horizontalAlignment = HorizontalAlignment.Center
      text.verticalAlignment = VerticalAlignment.Center

      this.cardObjects.push(cardObj)
    }

    print('[CardStripBuilder] Cards built successfully')
  }

  private setupInteraction(): void {
    // Desktop: use touch/tap events
    this.createEvent('TouchStartEvent').bind((ev: TouchStartEvent) => {
      this.handleTap(ev.getTouchPosition())
    })

    // Spectacles: use GestureModule pinch
    try {
      const gestureModule = require('LensStudio:GestureModule') as GestureModule
      gestureModule
        .getPinchDownEvent(GestureModule.HandType.Right)
        .add(() => this.handlePinch())
      gestureModule
        .getPinchDownEvent(GestureModule.HandType.Left)
        .add(() => this.handlePinch())
      print('[CardStripBuilder] Gesture interaction ready')
    } catch (e) {
      print('[CardStripBuilder] GestureModule not available (desktop mode)')
    }
  }

  private handleTap(touchPos: vec2): void {
    // Find closest card to tap using screen-space proximity
    if (!this.cameraObject) return
    const cam = this.cameraObject.getComponent('Component.Camera') as Camera
    if (!cam) return

    let bestIndex = -1
    let bestDist = Infinity

    for (let i = 0; i < this.cardObjects.length; i++) {
      const cardWorldPos = this.cardObjects[i]
        .getTransform()
        .getWorldPosition()
      const screenPos = cam.worldSpaceToScreenSpace(cardWorldPos)
      const dx = screenPos.x - touchPos.x
      const dy = screenPos.y - touchPos.y
      const dist = Math.sqrt(dx * dx + dy * dy)
      if (dist < bestDist) {
        bestDist = dist
        bestIndex = i
      }
    }

    // Threshold: card must be reasonably close to tap
    if (bestIndex >= 0 && bestDist < 0.15) {
      print('[CardStripBuilder] Tapped card ' + bestIndex)
      this.manager!.selectHouse(bestIndex)
    }
  }

  private handlePinch(): void {
    // On Spectacles, select the card closest to center of view
    if (!this.cameraObject) return

    const camTransform = this.cameraObject.getTransform()
    const camPos = camTransform.getWorldPosition()
    const camForward = camTransform.forward

    let bestIndex = -1
    let bestDot = -Infinity

    for (let i = 0; i < this.cardObjects.length; i++) {
      const cardPos = this.cardObjects[i]
        .getTransform()
        .getWorldPosition()
      const toCard = cardPos.sub(camPos).normalize()
      const dot = toCard.dot(camForward)
      if (dot > bestDot) {
        bestDot = dot
        bestIndex = i
      }
    }

    // Must be roughly in front of camera
    if (bestIndex >= 0 && bestDot > 0.9) {
      print('[CardStripBuilder] Pinch selected card ' + bestIndex)
      this.manager!.selectHouse(bestIndex)
    }
  }
}
