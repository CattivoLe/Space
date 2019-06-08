//
//  GameScene.swift
//  Space
//
//  Created by Alexander Omelchuk on 08.06.2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var spaceShip: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        spaceShip = SKSpriteNode(imageNamed: "spaceship")
        addChild(spaceShip)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveSpaceSchip(touches, ship: spaceShip)
    }
    
    final func moveSpaceSchip(_ touches: Set<UITouch>, ship: SKSpriteNode) {
        
        guard let touch = touches.first else {return}
        
        let touchLocation = touch.location(in: self)
        let moveAction = SKAction.move(to: touchLocation, duration: 0.5)
        
        ship.run(moveAction)
    }
    
    
}
