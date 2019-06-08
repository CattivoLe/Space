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
        addAsteroid()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveSpaceSchip(touches, ship: spaceShip)
    }
    
    //MARK: - Создаем елементы
    private func createNodes() {
        let screenSize = UIScreen.main.bounds
        
        spaceShip = SKSpriteNode(imageNamed: "spaceship")
        spaceBackground = SKSpriteNode(imageNamed: "background")
        
        spaceShip.size = CGSize(width: screenSize.width / 4, height: screenSize.height / 4)
        spaceBackground.size = CGSize(width: screenSize.width * 2.5, height: screenSize.height * 2.5)
        spaceBackground.zPosition = -1
        
        spaceShip.physicsBody = SKPhysicsBody(texture: spaceShip.texture!, size: spaceShip.size)
        spaceShip.physicsBody?.isDynamic = false
        
        addChild(spaceBackground)
        addChild(spaceShip)
    }
    
    //MARK: - Создаем движение
    private func moveSpaceSchip(_ touches: Set<UITouch>, ship: SKSpriteNode) {
        guard let touch = touches.first else {return}
        
        let touchLocation = touch.location(in: self)
        let moveAction = SKAction.move(to: touchLocation, duration: 0.5)
        
        ship.run(moveAction)
    }
    
    //MARK: - Создаем астероид
    private func createAsteroid() -> SKSpriteNode {
        let asteroid = SKSpriteNode(imageNamed: "asteroid")
        
        let randomScale = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(4)))
        asteroid.yScale = randomScale
        asteroid.xScale = randomScale
        
        asteroid.position.x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(frame.size.height / 6)))
        asteroid.position.y = frame.size.height + asteroid.size.height
        
        asteroid.physicsBody = SKPhysicsBody(texture: asteroid.texture!, size: asteroid.size)
        
        return asteroid
    }
    
    //MARK: - Добавляем астероиды
    private func addAsteroid() {
        let asteroidCreate = SKAction.run {
            let asteroid = self.createAsteroid()
            self.addChild(asteroid)
        }
        let creationDelay = SKAction.wait(forDuration: 0.5, withRange: 1)
        let sequenceAction = SKAction.sequence([asteroidCreate, creationDelay])
        let runAction = SKAction.repeatForever(sequenceAction)
        
        run(runAction)
    }
    
    
}
