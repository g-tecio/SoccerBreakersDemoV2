//
//  ConfigControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit


struct ConfigControls {
	
	/// Title Label
	let titleLabel: SKLabelNode
    
    // labels
    let volumeLabel: SKLabelNode
    let EffectsLabel: SKLabelNode
    let MusicLabel : SKLabelNode
	
	/// Exit Button and Label
	let buttonSprite:SKSpriteNode
	let buttonLabel: SKSpriteNode
    
    let background: SKSpriteNode
    let tShirtBackground: SKSpriteNode
    

    
	init(inThisScene: ConfigScene) {

        
        /// Title Label
        titleLabel = SKLabelNode.init(text: "Configuracion")
        titleLabel.name = "titleLabel-Inst"
        titleLabel.fontName = "Avenir-Heavy"
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.verticalAlignmentMode = .center
        titleLabel.fontColor = .white
        titleLabel.fontSize = 28
        titleLabel.zPosition = 3
        titleLabel.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(9/12)))
        
        volumeLabel = SKLabelNode.init(text: "Volumen del juego")
        volumeLabel.name = "titleLabel-Inst"
        volumeLabel.fontName = "Avenir-Heavy"
        volumeLabel.horizontalAlignmentMode = .center
        volumeLabel.verticalAlignmentMode = .center
        volumeLabel.fontColor = .white
        volumeLabel.fontSize = 20
        volumeLabel.zPosition = 3
        volumeLabel.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(8/12)))
        
        EffectsLabel = SKLabelNode.init(text: "Volumen de efectos")
        EffectsLabel.name = "titleLabel-Inst"
        EffectsLabel.fontName = "Avenir-Heavy"
        EffectsLabel.horizontalAlignmentMode = .center
        EffectsLabel.verticalAlignmentMode = .center
        EffectsLabel.fontColor = .white
        EffectsLabel.fontSize = 20
        EffectsLabel.zPosition = 3
        EffectsLabel.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(6/12)))
        
        
        MusicLabel = SKLabelNode.init(text: "Volumen de la musica")
        MusicLabel.name = "titleLabel-Inst"
        MusicLabel.fontName = "Avenir-Heavy"
        MusicLabel.horizontalAlignmentMode = .center
        MusicLabel.verticalAlignmentMode = .center
        MusicLabel.fontColor = .white
        MusicLabel.fontSize = 20
        MusicLabel.zPosition = 3
        MusicLabel.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*(4/12)))
        
        
        /// Background Image
        background = SKSpriteNode.init(imageNamed: "Background_Conf")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/2))
        
        /// Background Image
        tShirtBackground = SKSpriteNode.init(imageNamed: "T-shirt")
        tShirtBackground.name = "tShirt-background"
        tShirtBackground.zPosition = 2
        tShirtBackground.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height/1.8))
        
        /// Menu  Button
        buttonSprite = SKSpriteNode.init(imageNamed: "Button")
        buttonSprite.name = "buttonSprite-MenuConf"
        buttonSprite.zPosition = 3
        buttonSprite.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*2/20))
        
        /// Menu Label
        buttonLabel = SKSpriteNode.init(imageNamed: "Menu")
        buttonLabel.name = "Menu"
        buttonLabel.zPosition = 4
        
        /// Resizing depending to screen size
        let resizeFactorX:CGFloat = inThisScene.size.width/380.0
        let resizeFactorY:CGFloat = inThisScene.size.height/850.0
        let originalSize = buttonSprite.size
        buttonSprite.size = CGSize(width: originalSize.width*resizeFactorX*1.2, height: originalSize.height*resizeFactorY*1.2)
        buttonLabel.size = CGSize(width: originalSize.width*resizeFactorX*1.2, height: originalSize.height*resizeFactorY*1.2)
        
        /// Resizing Background
        let resizeFactorBgX:CGFloat = inThisScene.size.width/384.0
        let resizeFactorBgY:CGFloat = inThisScene.size.height/675.0
        let backgroundOriginalSize = background.size
        background.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX, height: backgroundOriginalSize.height*resizeFactorBgY)
        tShirtBackground.size = CGSize(width: backgroundOriginalSize.width*resizeFactorBgX/1.1, height: backgroundOriginalSize.height*resizeFactorBgY/1.4)
        
        /// Add Label to Scene
        buttonSprite.addChild(buttonLabel)
		
		
	}

}
