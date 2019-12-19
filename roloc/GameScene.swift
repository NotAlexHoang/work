import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var counter = 0
    var hitcount = 0
    var ball:SKSpriteNode!
    var paddle:SKSpriteNode!
    var score = SKLabelNode(fontNamed: "Helvetica Neue UltraLight 6")
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "Ball") as? SKSpriteNode
        paddle = self.childNode(withName: "Paddle") as? SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 35, dy: 35))
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        
        self.physicsWorld.contactDelegate = self
        score.text = String(counter)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyAName = contact.bodyA.node?.name
        let bodyBName = contact.bodyB.node?.name
        
        if bodyAName == "Ball" && bodyBName == "Brick" || bodyAName == "Brick" && bodyBName == "Ball"{
            
            if bodyAName == "Brick" {
                contact.bodyA.node?.removeFromParent()
                counter += 1
                
            } else if bodyBName == "Brick" {
                contact.bodyB.node?.removeFromParent()
                counter += 1
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if ball.position.y <= -640 {
            ball.position.x = paddle.position.x
            ball.position.y = -455
        }
    }
}
