//
//  CatEntity.swift
//  AC3.2-GamePlayKitIntro
//
//  Created by Louis Tur on 3/13/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit
import GameplayKit

// The entity is the representation of an object in its entirety. It is basically a container for GKComponents which define exactly how the entity behaves and reacts in your game
class CatEntity: GKEntity{
  let catTexture: SKTexture = SKTexture(imageNamed: "facing_forward_kitty_1")
  
  override init() {
    super.init()
    
    // We just need to instantiate and add relevant components
    // We can always add/remove them later as well, using add(component:) or remove(component:)
    let catSpriteComponent: SpriteComponent = SpriteComponent(texture: catTexture)
    
    addComponent(catSpriteComponent)
    addComponent(HungerComponent())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func update(deltaTime seconds: TimeInterval) {
    super.update(deltaTime: seconds)
    
    // we can iterrate over all of its components or call the relevant ones using component(ofType:)
    for component in components {
      component.update(deltaTime: seconds)
    }
  }
  
}
