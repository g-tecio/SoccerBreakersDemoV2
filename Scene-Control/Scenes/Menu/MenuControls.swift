//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct MenuControls {
	
	/// Background
	let background: SKSpriteNode
	
	/// Exit Button and Label
	let buttonSprite: SKSpriteNode
	let buttonLabel: SKSpriteNode
    
    /// Configuration Button
    let buttonConf:SKSpriteNode
    let buttonConfLabel: SKSpriteNode
    
    /// Game Button
    let buttonGame:SKSpriteNode
    let buttonGameLabel: SKSpriteNode
	
	init(inThisScene: MenuScene) {
		
		/// Background Image
        background = SKSpriteNode.init(imageNamed: "Bg_Menu")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
		
		/// Instructions  Button
		buttonSprite = SKSpriteNode.init(imageNamed: "Button")
		buttonSprite.name = "buttonSprite-Inst"
		buttonSprite.zPosition = 1
		buttonSprite.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*6/20))
		
		/// Instructions label
        buttonLabel = SKSpriteNode.init(imageNamed: "Inst")
        buttonLabel.name = "buttonSprite-Inst"
        buttonLabel.zPosition = 2
        
        /// Config  Button
        buttonConf = SKSpriteNode.init(imageNamed: "Button")
        buttonConf.name = "buttonSprite-Config"
        buttonConf.zPosition = 1
        buttonConf.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*3/20))
		
        /// Config Label
        buttonConfLabel = SKSpriteNode.init(imageNamed: "Conf")
        buttonConfLabel.name = "buttonSprite-Config"
        buttonConfLabel.zPosition = 2
        
        /// Game  Button
        buttonGame = SKSpriteNode.init(imageNamed: "Button")
        buttonGame.name = "buttonLabel-Jugar"
        buttonGame.zPosition = 1
        buttonGame.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*9/20))
        
        /// Game label
        buttonGameLabel = SKSpriteNode.init(imageNamed: "Jugar")
        buttonGameLabel.name = "buttonSprite-Jugar"
        buttonGameLabel.zPosition = 2
        
        
        /// Resizing depending to screen size
        let resizeFactorX:CGFloat = inThisScene.size.width/380.0
        let resizeFactorY:CGFloat = inThisScene.size.height/850.0
        let originalSize = buttonSprite.size
        buttonSprite.size = CGSize(width: originalSize.width*resizeFactorX*1.2, height: originalSize.height*resizeFactorY*1.2)
        buttonConf.size = CGSize(width: originalSize.width*resizeFactorX*1.2, height: originalSize.height*resizeFactorY*1.2)
        buttonGame.size = CGSize(width: originalSize.width*resizeFactorX*1.2, height: originalSize.height*resizeFactorY*1.2)
        buttonGameLabel.size = CGSize(width: originalSize.width*resizeFactorX, height: originalSize.height*resizeFactorY)
        buttonConfLabel.size = CGSize(width: originalSize.width*resizeFactorX, height: originalSize.height*resizeFactorY)
        buttonLabel.size = CGSize(width: originalSize.width*resizeFactorX, height: originalSize.height*resizeFactorY)
        
        /// Resizing Background
        let resizeFactorBgX:CGFloat = inThisScene.size.width/384.0
        let resizeFactorBgY:CGFloat = inThisScene.size.height/675.0
        let backgroundOriginalSize = background.size
        background.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
        
		/// Add Label to Scene
		buttonSprite.addChild(buttonLabel)
        buttonConf.addChild(buttonConfLabel)
        buttonGame.addChild(buttonGameLabel)
	}

}
