//
//  FishEntity.swift
//  AC3.2-GamePlayKitIntro
//
//  Created by Louis Tur on 3/13/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit
import GameplayKit

// This is more or less copy/pasted from CatEntity. 
// Creating new entities with specific components is incredibly modular and reuseable. 
class FishEntity: GKEntity {
  let fishTexture: SKTexture = SKTexture(imageNamed: "fish")
  
  override init() {
    super.init()
    
    let fishSpriteComponent: SpriteComponent = SpriteComponent(texture: fishTexture)
    
    addComponent(fishSpriteComponent)
//    addComponent(HungerComponent())
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func update(deltaTime seconds: TimeInterval) {
    super.update(deltaTime: seconds)
    
    for component in components {
      component.update(deltaTime: seconds)
    }
  }
}
