//
//  GameOver.swift
//  Scene-Control
//
//  Created by Manuel Raymundo Garcia Alvarez on 7/13/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameOver: GKState {
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        
        if previousState is Playing {
            
            let ball = scene.childNode(withName: BallCategoryName) as! SKSpriteNode
            ball.physicsBody!.linearDamping = 1.0
            scene.physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
            
        }
        
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is WaitingForTap.Type
    }
    
}
