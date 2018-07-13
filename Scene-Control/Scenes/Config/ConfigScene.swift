//
//  ConfigScene.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

import SpriteKit
import GameplayKit

class ConfigScene: SKScene {
	
	/// GameViewControl setup as reference to handle SceneStates
	var gameViewController: GameViewController!
	
	/// Config Controls
	var configControls: ConfigControls!
	
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
		configControls = ConfigControls.init(inThisScene: self)
		
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
		
		/// Present Label and Button
		self.addChild(configControls.titleLabel)
        self.addChild(configControls.volumeLabel)
        self.addChild(configControls.EffectsLabel)
        self.addChild(configControls.MusicLabel)
		self.addChild(configControls.buttonSprite)
        self.addChild(configControls.background)
        self.addChild(configControls.tShirtBackground)
	}
	
	/// Before another Scence will be presented
	override func willMove(from view: SKView) {
		removeAllChildren()
	}
	
	/// Touch event
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			let item = atPoint(location)
			
			/// Exit and return to GameScene
			if (item.name == "buttonSprite-MenuConf") || (item.name == "Menu") {
				gameViewController.sceneStateMachine.enter(MenuSceneState.self)
			}
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		
	}
	
}
