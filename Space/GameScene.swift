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
    var spaceBackground: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        createNodes()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveSpaceSchip(touches, ship: spaceShip)
    }
    
    //MARK: - Создаем елементы
    final func createNodes() {
        let screenSize = UIScreen.main.bounds
        
        spaceShip = SKSpriteNode(imageNamed: "spaceship")
        spaceBackground = SKSpriteNode(imageNamed: "background")
        
        spaceBackground.size = CGSize(width: screenSize.width * 2.5, height: screenSize.height * 2.5)
        spaceBackground.zPosition = -1
        
        addChild(spaceBackground)
        addChild(spaceShip)
    }
    
    //MARK: - Создаем движение
    final func moveSpaceSchip(_ touches: Set<UITouch>, ship: SKSpriteNode) {
        
        guard let touch = touches.first else {return}
        
        let touchLocation = touch.location(in: self)
        let moveAction = SKAction.move(to: touchLocation, duration: 0.5)
        
        ship.run(moveAction)
    }
    
    
}
