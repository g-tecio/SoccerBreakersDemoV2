//
//  GameData.swift
//  Scene-Control
//
//  Created by Fernando Vazquez on 7/4/18.
//  Copyright © 2018 Cartwheel Galaxy. All rights reserved.
//

class GameData {
	
	static let shared = GameData()
	
	private init() {
		
		// TODO: Restore from file, if does't exist create it with standard values
		
	}
	
	/// Configuration values
	var savedValue: Int = 5

}
