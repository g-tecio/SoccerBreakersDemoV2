//
//  ConfigScene.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class InstructionsScene: SKScene {
	
	/// GameViewControl setup as reference to handle SceneStates
	var gameViewController: GameViewController!
	
	/// Config Controls
	var instructionsControls: InstructionsControls!
	
	//    var entities = [GKEntity]()
	//    var graphs = [String : GKGraph]()
	
	private var lastUpdateTime : TimeInterval = 0
	
	/// Custom Initializer
	init(sceneSize: CGSize, referenceGVC: GameViewController) {
		
		/// Set reference of GameViewControl
		gameViewController = referenceGVC
		
		/// Create scene from code
		super.init(size: sceneSize)
		
		/// Config Controls
		instructionsControls = InstructionsControls.init(inThisScene: self)
		
		/// Load scene
		if let skView = gameViewController.view as! SKView? {
			self.size = skView.bounds.size
			self.scaleMode = .fill
			
			// TODO: Comment or remove before release to App Store
			skView.ignoresSiblingOrder = true
			skView.showsFPS = true
			skView.showsNodeCount = true
		}
	}
	
	/// Included because is a requisite if a custom Init is used
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	/// Present Elements to the Scene
	override func didMove(to view: SKView) {
        self.view?.isMultipleTouchEnabled = true
		
		/// Present Label and Button
		self.addChild(instructionsControls.background1)
        self.addChild(instructionsControls.background2)
        self.addChild(instructionsControls.background3)
//        self.addChild(instructionsControls.buttonSprite)
         instructionsControls.background1.isHidden = false
         instructionsControls.background2.isHidden = false
	}
	
	/// Before another Scence will be presented
	override func willMove(from view: SKView) {
		removeAllChildren()
	}
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			let item = atPoint(location)
			
			/// Exit and return to GameScene
			if (item.name == "background1") {
                instructionsControls.background1.isHidden = true
            }
            if (item.name == "background2") {
                instructionsControls.background2.isHidden = true
                //                gameViewController.sceneStateMachine.enter(MenuSceneState.self)
            }
            if (item.name == "background3") {
            gameViewController.sceneStateMachine.enter(MenuSceneState.self)
            }
            
            
        }
    }

	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
}
