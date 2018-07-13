//
//  GameScene.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

//Time Var and Let
let timeSeconds = 60
var timer = Timer()
var seconds = timeSeconds
var timerSeconds = ("TIEMPO:\(seconds)")

//Score Var and Let
let points = 0
var score = points
var pointsCount = ("GOLES: \(score)")

let BallCategoryName = "ball"
let PaddleCategoryName = "paddle"
let BlockCategoryName = "block"
let GameMessageName = "gameMessage"


let BallCategory   : UInt32 = 0x1 << 0
let BottomCategory : UInt32 = 0x1 << 1
let BlockCategory  : UInt32 = 0x1 << 2
let PaddleCategory : UInt32 = 0x1 << 3
let BorderCategory : UInt32 = 0x1 << 4

//fx sounds
var blipSound = AVAudioPlayer()
var blipPaddleSound = AVAudioPlayer()
var bambooBreakSound = AVAudioPlayer()
var gameWonSound = AVAudioPlayer()
var gameOverSound = AVAudioPlayer()
var flagsBreakSound = AVAudioPlayer()


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    
    //Reply Button
    let buttonSpriteReply = SKSpriteNode.init(imageNamed: "Reply")
    
    // the definition of the var is FingerPaddle
    var isFingerOnPaddle = false
    
    /// GameViewControl setup as reference to handle SceneStates
    var gameViewController: GameViewController!
    
    /// Game Controls
    var gameControls: GameControls!
    var flagSprite: [FlagSprite] = []
    
    private var lastUpdateTime : TimeInterval = 0
    
    /// Custom Initializer
    init(sceneSize: CGSize, referenceGVC: GameViewController) {
        
        /// Set reference of GameViewControl
        gameViewController = referenceGVC
        
        /// Create scene from code
        super.init(size: sceneSize)
        
        /// Game Controls
        gameControls = GameControls.init(inThisScene: self)
        
        //IF
        var numFlag = 0
        
        for row in 1...4{
            for col in 0...7{
                // Flags Controls
                flagSprite.append(FlagSprite.init(numFlag: numFlag, row: row ,col: col ,inThisScene: self))
                numFlag += 1
            }
        }
        
        
        /// Load scene
        if let skView = gameViewController.view as! SKView? {
            self.size = skView.bounds.size
            self.scaleMode = .fill
            
            // TODO: Comment or remove before release to App Store
            skView.ignoresSiblingOrder = true
            skView.showsFPS = true
            skView.showsNodeCount = true
        }
    }//END Custom Init
    
    /// Included because is a requisite if a custom Init is used
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }//END init
    
    /// Present Elements to the Scene
    override func didMove(to view: SKView) {
        
        super.didMove(to: view)
        
        // Background ball and paddle
        self.addChild(gameControls.background)
        self.addChild(gameControls.paddle)
        
        
        
        // Label
        self.addChild(gameControls.timerLabel)
        self.addChild(gameControls.scoreLabel)
        
        //Flag
        for flag in 0...31{
            self.addChild(flagSprite[flag].block)
            
        }

        do{
        
            blipSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource:"LostBallFlags", ofType: "mp3")!))
            blipSound.prepareToPlay()
            blipPaddleSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource:"BallTouchTheScreen", ofType: "mp3")!))
            blipPaddleSound.prepareToPlay()
            gameWonSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource:"GameWinFlags", ofType: "mp3")!))
            gameWonSound.prepareToPlay()
            gameOverSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource:"GameOverFlags", ofType: "mp3")!))
            gameOverSound.prepareToPlay()
            flagsBreakSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource:"breakeFlags", ofType: "mp3")!))
            blipSound.prepareToPlay()
            
        }
        catch{
            print(error)
        }
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        physicsWorld.contactDelegate = self as? SKPhysicsContactDelegate
        
        let ball = gameControls.ball
        ball.physicsBody!.applyImpulse(CGVector(dx: 2.0, dy: -2.0))
        
        let bottomRect = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 1)
        
        let bottom = SKNode()
        bottom.physicsBody = SKPhysicsBody(edgeLoopFrom: bottomRect)
        addChild(bottom)
        
        let paddle = gameControls.paddle
        
        bottom.physicsBody!.categoryBitMask = BottomCategory
        ball.physicsBody!.categoryBitMask = BallCategory
        paddle.physicsBody!.categoryBitMask = PaddleCategory
        gameControls.borderBody.categoryBitMask = BorderCategory
        
        ball.physicsBody!.contactTestBitMask = BottomCategory | BlockCategory | BorderCategory | PaddleCategory
        
        
        //Timer And Score
        gameControls.scoreLabel.text = pointsCount
        gameControls.timerLabel.text = timerSeconds
        
        
        
        
        //Tap To Play
        self.addChild(gameControls.gameMessage)
        
        //Flaming Effect And Ball
        self.addChild(gameControls.ball)
        self.addChild(gameControls.trailNode)
        
        gameState.enter(WaitingForTap.self)
        
        
        
    }//END didMove
    
    lazy var gameState: GKStateMachine = GKStateMachine(states: [
        WaitingForTap(scene: self),
        Playing(scene: self),
        GameOver(scene: self)])
 /*
    let blipSound = SKAction.playSoundFileNamed("LostBallFlags", waitForCompletion: false)
    let blipPaddleSound = SKAction.playSoundFileNamed("BallTouchTheScreen", waitForCompletion: false)
    let flagsBreakSound = SKAction.playSoundFileNamed("breakeFlags", waitForCompletion: false)
    let gameWonSound = SKAction.playSoundFileNamed("GameWinFlags", waitForCompletion: false)
    let gameOverSound = SKAction.playSoundFileNamed("GameOverFlags", waitForCompletion: false)
 */
    

    
    
    var gameWon : Bool = false {
        
        didSet {
            let gameOver = childNode(withName: GameMessageName) as! SKSpriteNode
            let textureName = gameWon ? "YouWon" : "GameOver"
            let texture = SKTexture(imageNamed: textureName)
            let actionSequence = SKAction.sequence([SKAction.setTexture(texture), SKAction.scale(to: 1.0, duration: 0.25)])
            
            
            self.addChild(gameControls.buttonSpriteReply)
            
            gameOver.run(actionSequence)
            
            gameWon ? gameWonSound.play() : gameOverSound.play()
            
        }
        
    }
    
    /// Before another Scence will be presented
    override func willMove(from view: SKView) {
        removeAllChildren()
    }//END WillMove
    
    /// Touch event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch gameState.currentState {
        case is WaitingForTap:
            gameState.enter(Playing.self)
            isFingerOnPaddle = true
            //ADD THIS LINE
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameScene.clock), userInfo: nil, repeats:true)
            
        case is Playing:
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            
            if let body = physicsWorld.body(at: touchLocation) {
                
                if body.node!.name == PaddleCategoryName {
                    
                    isFingerOnPaddle = true
                    
                }
            }
            
        case is GameOver:
            
            //Timer Line
            seconds = timeSeconds
            //Score Line
            score = points
            
            gameControls.ball.position = CGPoint(x: self.size.width/2 , y: self.size.height * (1.5/10))
            
            gameControls.paddle.position = CGPoint(x: self.size.width/2 , y: self.size.height/10 )
            
        default:
            break
        }
        
        for touch in touches {
            let location = touch.location(in: self)
            let item = atPoint(location)
            
            // Exit and return to GameScene
            if (item.name == "buttonSprite-Game" || item.name == "menuLabel") {
                
                reset = false
                gameViewController.sceneStateMachine.enter(MenuSceneState.self)
            }
            
        }
    }//END TouchesBegan
    
    var reset : Bool = false {
        
        didSet {
            let gameOver = childNode(withName: GameMessageName) as! SKSpriteNode
            let textureName = gameWon ? "TapToPlay" : "TapToPlay"
            let texture = SKTexture(imageNamed: textureName)
            let actionSequence = SKAction.sequence([SKAction.setTexture(texture), SKAction.scale(to: 1.0, duration: 0.25)])
            
            gameOver.run(actionSequence)
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //1
        if isFingerOnPaddle {
            //2
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            let previousLocation = touch!.previousLocation(in: self)
            //3
            let paddle = childNode(withName: PaddleCategoryName) as! SKSpriteNode
            //4
            var paddleX = paddle.position.x + (touchLocation.x - previousLocation.x)
            //5
            paddleX = max(paddleX, paddle.size.width/2)
            paddleX = min(paddleX, size.width - paddle.size.width/2)
            //6
            paddle.position = CGPoint(x: paddleX, y: paddle.position.y)
        }
    }//END TouchesMoved
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Paddle
        isFingerOnPaddle = false
    }//END TouchesEnded
    
    
    
    
    @objc func clock() {
        seconds=seconds-1
        gameControls.timerLabel.text = ("TIEMPO: \(seconds)")
        if (seconds==0){
            gameState.enter(GameOver.self)
            gameWon = false
            timer.invalidate()
            
        }
    }//END Clock
    
    
    override func update(_ currentTime: TimeInterval) {
        
        gameState.update(deltaTime: currentTime)
        
    }//END Update
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if gameState.currentState is Playing {
            
            // 1
            var firstBody: SKPhysicsBody
            var secondBody: SKPhysicsBody
            // 2
            if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
                firstBody = contact.bodyA
                secondBody = contact.bodyB
            } else {
                firstBody = contact.bodyB
                secondBody = contact.bodyA
            }
            // 3
            if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BottomCategory {
                /*print("Hit bottom. First contact has been made.") Line replaced with the following*/
                gameState.enter(GameOver.self)
                gameWon = false
                timer.invalidate()
            }
            
            if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BlockCategory {
                breakBlock(node: secondBody.node!)
                
                //TODO: check if the game has been won
                if isGameWon() {
                    
                    gameState.enter(GameOver.self)
                    gameWon = true
                    timer.invalidate()
                    
                }
            }
            //Adding soun effects
            if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BorderCategory {
                
                blipSound.play()
                
            }
            if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BorderCategory {
                
                blipPaddleSound.play()
                
            }
        }
        
    }//END DidBegin
    
    
    //Position and break the flags bricks
    func breakBlock(node: SKNode) {
        
        //Break flags sound
        flagsBreakSound.play()
        
        let particles = SKEmitterNode(fileNamed: "BrokenPlatform")!
        particles.position = node.position
        particles.zPosition = 3
        addChild(particles)
        particles.run(SKAction.sequence([SKAction.wait(forDuration: 1.0), SKAction.removeFromParent()]))
        node.removeFromParent()
        //Score
        score += 1
        gameControls.scoreLabel.text = ("GOLES: \(score)")
    }//END BreakBlocks
    
    func randomFloat(from: CGFloat, to: CGFloat) -> CGFloat {
        
        let rand: CGFloat = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        return (rand) * (to - from) + from
    }//End RandomFloat
    
    func isGameWon() -> Bool {
        
        var numberOfBricks = 0
        self.enumerateChildNodes(withName: BlockCategoryName) {
            
            node, stop in
            numberOfBricks = numberOfBricks + 1
            
        }
        
        return numberOfBricks == 0
        
    }//END IsGameWon
    
}//END CLASS

