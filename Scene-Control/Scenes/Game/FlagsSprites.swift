//
//  FlagsSprites.swift
//  Scene-Control
//
//  Created by Luis Reyes on 7/10/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct FlagSprite {
    
    //Flag
    let block : SKSpriteNode!
    let block2 : SKSpriteNode!
    
    //Array Flags
    let flags = ["Arabia", "Argentina", "Australia", "Belgium", "Brazil", "Colombia", "Costa Rica", "Croatia", "Denmark", "Egypt", "England", "France", "Germany", "Iceland", "Iran", "Japan", "Mexico", "Morocco", "Nigeria", "Panama", "Peru", "Poland", "Portugal", "Russia", "Senegal", "Serbia", "South_Corea", "Spain", "Sweden","Switzerland","Tunizia", "Uruguay"]
    
    init (numFlag: Int, row: Int, col: Int , inThisScene: GameScene) {
        
        block = SKSpriteNode(imageNamed: flags[numFlag])
        block2 = SKSpriteNode(imageNamed: flags[1])
        
        let numberOfBlocks = 11.25
        
        // Resizing depending to screen size
        let resizeFactorX:CGFloat = inThisScene.size.width/407.0
        let resizeFactorY:CGFloat = inThisScene.size.height/599.0
        let blockOriginalSize = block.size
        block.size = CGSize(width: blockOriginalSize.width*resizeFactorX, height: blockOriginalSize.height*resizeFactorY)
        
        let block2OriginalSize = block2.size
        block2.size = CGSize(width: block2OriginalSize.width*resizeFactorX, height: block2OriginalSize.height*resizeFactorY)
        
        let blockWidth = block.size.width / 1.9
        let totalBlocksWidth = blockWidth * CGFloat(numberOfBlocks)
        let xOffset = (inThisScene.size.width - totalBlocksWidth) / 2
        let blockScale = 0.7
        
        block.position = CGPoint(x: xOffset + CGFloat( CGFloat(col) + 1) * (blockWidth * 1.25),
                                 y: (inThisScene.size.height * 0.91) - ((block2.size.height * 0.9 ) * CGFloat(row)))
        
        block.physicsBody = SKPhysicsBody(rectangleOf: block.frame.size)
        block.physicsBody!.allowsRotation = false
        block.physicsBody!.friction = 0.0
        block.physicsBody!.affectedByGravity = false
        block.physicsBody!.isDynamic = false
        block.name = BlockCategoryName
        block.physicsBody!.categoryBitMask = BlockCategory
        block.zPosition = 2
        block.setScale(CGFloat (blockScale))
        
    }
}

