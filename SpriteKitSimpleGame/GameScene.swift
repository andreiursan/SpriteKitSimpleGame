//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by Andrei Ursan on 9/20/14.
//  Copyright (c) 2014 Andrei Ursan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  override func didMoveToView(view: SKView) {
    /* Setup your scene here */
  }

  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    /* Called when a touch begins */

    for touch: AnyObject in touches {
      let location = touch.locationInNode(self)
    }
  }

  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
}
