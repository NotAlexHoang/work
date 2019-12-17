//
//  GameScene.swift
//  roloc
//
//  Created by Hoang, Alex on 12/11/19.
//  Copyright © 2019 hmdwc. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var paddle = SKSpriteNode()
    var score = [Int]()
    
    func startGame() {
        score = [0,0]
    }
    
    func addScore(player: SKSpriteNode) {
        
    }
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "Ball") as! SKSpriteNode
        paddle = self.childNode(withName: "Paddle") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 30))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 0
        
        self.physicsBody = border
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            paddle.run(SKAction.moveTo(x: location.x, duration: 0))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            paddle.run(SKAction.moveTo(x: location.x, duration: 0))
        }
    }
    
    func didBegin(contact: SKPhysicsContact) {
        let bodyA = contact.bodyA.node?.name
        let bodyB = contact.bodyB.node?.name
        
        if bodyA == "Ball" && bodyB == "Brick" || bodyA == "Brick" && bodyB == "Ball" {
            contact.bodyA.node?.removeFromParent()
        } else if bodyB == "Brick" {
            contact.bodyB.node?.removeFromParent()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if ball.position.y <= -640
        {
            score = [0,0]
            ball.position.x = paddle.position.x
            ball.position.y = -455
        }
    }
}
