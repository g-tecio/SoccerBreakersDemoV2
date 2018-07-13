//
//  ConfigControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct InstructionsControls {
	
	/// Title Label
	let background1: SKSpriteNode
    let background2: SKSpriteNode
    let background3: SKSpriteNode
    
	/// Exit Button and Label
	let buttonSprite:SKSpriteNode
	let buttonLabel: SKSpriteNode
	
	init(inThisScene: InstructionsScene) {
		
        /// Background Image
        background1 = SKSpriteNode.init(imageNamed: "Instruction 1")
        background1.name = "background1"
        background1.zPosition = 5
        background1.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        
        /// Background Image
        background2 = SKSpriteNode.init(imageNamed: "Instruction 2")
        background2.name = "background2"
        background2.zPosition = 4
        background2.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        
        /// Background Image
        background3 = SKSpriteNode.init(imageNamed: "Instruction 3")
        background3.name = "background3"
        background3.zPosition = 1
        background3.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        
		
		/// Menu  Button
		buttonSprite = SKSpriteNode.init(imageNamed: "Button")
		buttonSprite.name = "buttonSprite-MenuInst"
		buttonSprite.zPosition = 2
		buttonSprite.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*2/20))
        
        /// Menu Label
        buttonLabel = SKSpriteNode.init(imageNamed: "Menu")
        buttonLabel.name = "Menu"
        buttonLabel.zPosition = 3
		
		/// Resizing buttons
		let resizeFactorX:CGFloat = inThisScene.size.width/380.0
		let resizeFactorY:CGFloat = inThisScene.size.height/850.0
		let originalSize = buttonSprite.size
		buttonSprite.size = CGSize(width: originalSize.width*resizeFactorX*1.2, height: originalSize.height*resizeFactorY*1.2)
        buttonLabel.size = CGSize(width: originalSize.width*resizeFactorX*1.2, height: originalSize.height*resizeFactorY*1.2)
        
        /// Resizing Background
        let resizeFactorBgX:CGFloat = inThisScene.size.width/384.0
        let resizeFactorBgY:CGFloat = inThisScene.size.height/675.0
        let backgroundOriginalSize = background1.size
        background1.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
		background2.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
        background3.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
        
		/// Add Label to Scene
		buttonSprite.addChild(buttonLabel)
	}

}
