//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct GameControls {
	
	/// Exit Button and Label
	let buttonSprite:SKSpriteNode
	let buttonLabel: SKLabelNode
    
    let  titleLabel: SKLabelNode
    
	
	init(inThisScene: GameScene) {
        
        /// Title Label
        titleLabel = SKLabelNode.init(text: "Game Scene")
        titleLabel.name = "titleLabel-Inst"
        titleLabel.fontName = "Avenir-Heavy"
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.verticalAlignmentMode = .center
        titleLabel.fontColor = .white
        titleLabel.fontSize = 32
        titleLabel.zPosition = 2
        titleLabel.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(3/4)))
		
		/// Exit  Button
		buttonSprite = SKSpriteNode.init(imageNamed: "Button")
		buttonSprite.name = "buttonSprite-Menu"
		buttonSprite.zPosition = 1
		buttonSprite.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*1/13))
		
		
		/// Button label
		buttonLabel = SKLabelNode.init(text: "Return Menu")
		buttonLabel.name = "buttonLabel-Menu"
		buttonLabel.fontName = "Avenir-Heavy"
		buttonLabel.horizontalAlignmentMode = .center
		buttonLabel.verticalAlignmentMode = .center
		buttonLabel.fontColor = .white
		buttonLabel.fontSize = 24
		buttonLabel.zPosition = 2
		buttonLabel.position = CGPoint(x: 0, y: 0)
        
        
        /// Resizing depending to screen size
        let resizeFactorX:CGFloat = inThisScene.size.width/407.0
        let resizeFactorY:CGFloat = inThisScene.size.height/599.0
        let originalSize = buttonSprite.size
        buttonSprite.size = CGSize(width: originalSize.width*resizeFactorX, height: originalSize.height*resizeFactorY)

		/// Add Label to Scene
		buttonSprite.addChild(buttonLabel)
	}

}
