//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by Andrei Ursan on 9/20/14.
//  Copyright (c) 2014 Andrei Ursan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

  let player = SKSpriteNode(imageNamed: "player")
  var lastSpawnTimeInterval = CFTimeInterval(0)
  var lastUpdateTimeInterval = CFTimeInterval(0)

  override func didMoveToView(view: SKView) {
    /* Setup your scene here */
    self.backgroundColor = SKColor.whiteColor()
    self.player.position =  CGPointMake(self.player.size.width/2, self.frame.size.height/2)
    self.addChild(self.player)
  }

  func addMonster() {
    let monster = SKSpriteNode(imageNamed: "monster")
    let minY = UInt32(monster.size.height / 2)
    let maxY = UInt32(self.frame.size.height - monster.size.height / 2)
    let rangeY = maxY - minY
    let actualY =  CGFloat(arc4random_uniform(rangeY) + minY)
    monster.position = CGPointMake(self.frame.size.width + monster.size.width/2, actualY)
    self.addChild(monster)

    let minDuration: UInt32 = 2
    let maxDuration: UInt32 = 4
    let actualDuration = NSTimeInterval(arc4random_uniform(maxDuration - 1) + minDuration)
    let action = SKAction.moveTo(CGPointMake(-monster.size.width/2, actualY), duration:actualDuration)
    let actionMoveDone = SKAction.removeFromParent()

    monster.runAction(SKAction.sequence([action, actionMoveDone]))
  }

  func updateWithTimeSinceLastUpdate(timeSinceLast: CFTimeInterval){
    self.lastSpawnTimeInterval += timeSinceLast
    if (self.lastSpawnTimeInterval > 1) {
      self.lastSpawnTimeInterval = 0
      self.addMonster()
    }
  }

  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    /* Called when a touch begins */

    for touch: AnyObject in touches {
      let location = touch.locationInNode(self)
    }
  }

  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
    var timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
      timeSinceLast = 1.0 / 60.0
      self.lastUpdateTimeInterval = currentTime;
    }
    self.updateWithTimeSinceLastUpdate(timeSinceLast)
  }
}
