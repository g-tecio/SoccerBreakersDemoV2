//
//  WaitingForTap.swift
//  Scene-Control
//
//  Created by Manuel Raymundo Garcia Alvarez on 7/13/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class WaitingForTap: GKState {
    unowned let scene: GameScene
    
    init(scene: SKScene) {
        self.scene = scene as! GameScene
        super.init()
    }
    
    override func didEnter(from previousState: GKState?) {
        
        let scale = SKAction.scale(to: 1.0, duration: 0.25)
        scene.childNode(withName: GameMessageName)!.run(scale)
        
    }
    
    override func willExit(to nextState: GKState) {
        
        if nextState is Playing {
            
            let scale = SKAction.scale(to: 0, duration: 0.4)
            scene.childNode(withName: GameMessageName)!.run(scale)
            
        }
        
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is Playing.Type
    }
    
}
