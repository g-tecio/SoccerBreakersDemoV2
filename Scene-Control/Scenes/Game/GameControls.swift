//
//  GameControls.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit

struct GameControls {
    
    // Background
    let background: SKSpriteNode
    
    // Paddle
    let  paddle: SKSpriteNode
    
    // Ball
    let ball: SKSpriteNode
    
    //Game Message Name
    let gameMessage: SKSpriteNode
    
    //Timer
    let timerLabel: SKLabelNode
    
    //Score
    let scoreLabel: SKLabelNode
    
    //Screen Barrier
    let borderBody: SKPhysicsBody
    
    //flaming
    let trailNode : SKNode
    let trail : SKEmitterNode
    
    //Reply Button
    let buttonSpriteReply: SKSpriteNode
    let buttonLabelReply : SKSpriteNode
    
    init(inThisScene: GameScene) {
        
        // Background
        background = SKSpriteNode.init(imageNamed: "Background")
        background.name = "background"
        background.zPosition = 1
        background.position = CGPoint(x: inThisScene.size.width/2, y: inThisScene.size.height/2)
        
        // Resizing depending to screen size
        let resizeFactorX:CGFloat = inThisScene.size.width/407.0
        let resizeFactorY:CGFloat = inThisScene.size.height/599.0
        let backgroundOriginalSize = background.size
        background.size = CGSize(width: backgroundOriginalSize.width*resizeFactorX, height: backgroundOriginalSize.height*resizeFactorY)
        
        //Paddle
        paddle = SKSpriteNode.init(imageNamed: "Base")
        paddle.name = "paddle"
        paddle.zPosition = 3
        paddle.position = CGPoint(x: inThisScene.size.width/2 , y: inThisScene.size.height/10 )
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
        paddle.physicsBody?.isDynamic = false
        paddle.physicsBody?.friction = 0
        paddle.physicsBody?.restitution = 1
        
        // Resizing depending to screen size
        let pOriginalSize = paddle.size
        paddle.size = CGSize(width: pOriginalSize.width*resizeFactorX, height: pOriginalSize.height*resizeFactorY)
        
        //Ball
        ball = SKSpriteNode.init(imageNamed: "Ball")
        ball.name = "ball"
        ball.zPosition = 2
        ball.position = CGPoint(x: inThisScene.size.width/2 , y: inThisScene.size.height * (1.5/10))
        ball.physicsBody = SKPhysicsBody(circleOfRadius: (ball.size.width / 2))
        ball.physicsBody?.allowsRotation = false
        ball.physicsBody?.affectedByGravity = true
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.mass = 0.01
        
        // Resizing depending to screen size
        let ballresizeFactorX:CGFloat = inThisScene.size.width/350.0
        let ballresizeFactorY:CGFloat = inThisScene.size.height/599.0
        let bOriginalSize = ball.size
        ball.size = CGSize(width: bOriginalSize.width*ballresizeFactorX, height: bOriginalSize.height*ballresizeFactorX)
        
        //Timer
        timerLabel = SKLabelNode.init(text: "TIEMPO: ")
        timerLabel.name = "TimerLabel-Game"
        timerLabel.fontName = "Pixellari"
        timerLabel.horizontalAlignmentMode = .center
        timerLabel.verticalAlignmentMode = .center
        timerLabel.fontColor = UIColor(red: 249.0, green: 254.0, blue: 00, alpha: 1)
        timerLabel.fontSize = 21
        timerLabel.zPosition = 4
        timerLabel.position = CGPoint(x: inThisScene.size.width/1.27, y: inThisScene.size.height * (0.96))
        let resizeFactorFont:CGFloat = inThisScene.size.width / 407.0
        timerLabel.fontSize *= resizeFactorFont
        
        
        //Score
        scoreLabel = SKLabelNode.init(text: "GOLES: ")
        scoreLabel.name = "ScoreLabel-Game"
        scoreLabel.fontName = "Pixellari"
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.verticalAlignmentMode = .center
        scoreLabel.fontColor = UIColor(red: 249.0, green: 254.0, blue: 00, alpha: 1)
        scoreLabel.fontSize = 21
        scoreLabel.zPosition = 4
        scoreLabel.position = CGPoint(x: inThisScene.size.width/4.6, y: inThisScene.size.height * (0.96))
        
        scoreLabel.fontSize *= resizeFactorFont
        
        
        //Barrier
        borderBody = SKPhysicsBody(edgeLoopFrom: inThisScene.frame)
        borderBody.friction = 0
        inThisScene.physicsBody = borderBody
        
        //Flaming effect
        // 1
        trailNode = SKNode()
        trailNode.zPosition = 1
        trail = SKEmitterNode(fileNamed: "BallTrail")!
        trail.targetNode = trailNode
        ball.addChild(trail)
        
        //Go to menu
        buttonSpriteReply = SKSpriteNode.init(imageNamed: "Button")
        buttonSpriteReply.name = "buttonSprite-Game"
        buttonSpriteReply.zPosition = 2
        buttonSpriteReply.position = CGPoint(x: inThisScene.size.width/2, y: inThisScene.size.height * (0.35))
        ///
        buttonLabelReply = SKSpriteNode.init(imageNamed: "Menu")
        buttonLabelReply.name = "menuLabel"
        buttonLabelReply.zPosition = 3

        
        // Resizing depending to screen size
        let resizeFactorXReply:CGFloat = inThisScene.size.width/407.0
        let resizeFactorYReply:CGFloat = inThisScene.size.height/599.0
        let originalSizeReply = buttonSpriteReply.size
        buttonSpriteReply.size = CGSize(width: originalSizeReply.width*resizeFactorXReply, height: originalSizeReply.height*resizeFactorYReply)
         buttonLabelReply.size = CGSize(width: originalSizeReply.width*resizeFactorXReply, height: originalSizeReply.height*resizeFactorYReply)
       
        //GameMessage
        gameMessage = SKSpriteNode(imageNamed: "TapToPlay")
        gameMessage.name = GameMessageName
        gameMessage.position = CGPoint(x: inThisScene.size.width/2, y: inThisScene.size.height/2)
        gameMessage.zPosition = 4
        
        // Resizing depending to screen size
        let originalSizeMessage = gameMessage.size
        gameMessage.size = CGSize(width: originalSizeMessage.width*resizeFactorX, height: originalSizeMessage.height*resizeFactorY)
        
        buttonSpriteReply.addChild(buttonLabelReply)
    }
    
}
