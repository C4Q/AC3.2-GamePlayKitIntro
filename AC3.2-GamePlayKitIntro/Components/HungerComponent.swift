//
//  HungerComponent.swift
//  AC3.2-GamePlayKitIntro
//
//  Created by Louis Tur on 3/13/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit
import GameplayKit

// This component is used to demonstrate updating game logic via the update(deltaTime:) function 
// The goal is to have the hungerValue decrease over time; every 2 seconds in this case
class HungerComponent: GKComponent {

  var hungerValue: Int = 100
  var lastUpdated: TimeInterval = TimeInterval(0)
  let updateInterval: TimeInterval = TimeInterval(2)
  
  override func update(deltaTime seconds: TimeInterval) {
    super.update(deltaTime: seconds)
    
    if seconds - lastUpdated > updateInterval {
      
      hungerValue = hungerValue - 1
      lastUpdated = seconds
      print("MEEEOOOOW: HUNGRY \(self.hungerValue)")
    }
    
  }
  
}
