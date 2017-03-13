//
//  SunnyDayScene.swift
//  AC3.2-GamePlayKitIntro
//
//  Created by Louis Tur on 3/13/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit
import SpriteKit

class SunnyDayScene: SKScene {

  let backgroundTexture: SKTexture = SKTexture(imageNamed: "bkgd_sunnyday")
  
  // instances of our entities
  let catEntity: CatEntity = CatEntity()
  let fishEntity: FishEntity = FishEntity()
  
  var backgroundNode: SKSpriteNode?
  
  override init(size: CGSize) {
    super.init(size: size)
    
    // create our background node
    backgroundNode = SKSpriteNode(texture: backgroundTexture, size: size)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
  override func didMove(to view: SKView) {
    super.didMove(to: view)
    
    // set the zPosition to ensure that we know the exact layering of the sprites
    self.backgroundNode?.zPosition = 10
    
    // this changes the nodes anchorpoint (which is 0.5, 0.5 by defauly, corresponding to the middle of the node) to (0.0, 0.0) which corresponds to the bottom left of the screen
    self.backgroundNode?.anchorPoint = self.anchorPoint
    self.addChild(backgroundNode!)
    
    // checking to see if a sprite component exists in catEntity using GKEntity's built-in
    // component(ofType:)
    // Once we ensure that teh component exists, we can set its position and add the actuall
    // SKSpriteNode to the SKScene
    if let catSprite = catEntity.component(ofType: SpriteComponent.self) {
      catSprite.spriteNode.zPosition = 20
      catSprite.spriteNode.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
      self.addChild(catSprite.spriteNode)
    }
    
    if let fishSprite = fishEntity.component(ofType: SpriteComponent.self) {
      fishSprite.spriteNode.zPosition = 20
      fishSprite.spriteNode.position = CGPoint(x: self.frame.midX + 50, y: self.frame.midY + 50)
      self.addChild(fishSprite.spriteNode)
    }
  }
  
  // This gets called automatically every 1/60th of a second (60fps)
  // This is where you want to ensure your game logic is being updated
  override func update(_ currentTime: TimeInterval) {
    super.update(currentTime)
    
    self.catEntity.update(deltaTime: currentTime)
    self.fishEntity.update(deltaTime: currentTime)
  }
}
