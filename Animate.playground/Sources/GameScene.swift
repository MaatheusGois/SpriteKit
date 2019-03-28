import Foundation
import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene {
    
    var felpudo:SKSpriteNode!
    var arrayImagensFelpudo:[SKTexture] = []
    
    override public func didMove(to view: SKView) {
        felpudo = SKSpriteNode(imageNamed: "Animate0")
        
        for i in 0...1{
            arrayImagensFelpudo.append(SKTexture(imageNamed: "Animate\(i)"))
            print(i)
        }
        
        var animate = SKAction.animate(with: arrayImagensFelpudo, timePerFrame: 1)
        felpudo.run(.repeatForever(animate))
        addChild(felpudo)
    }
    
    @objc static public override var supportsSecureCoding: Bool {
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    public override func update(_ currentTime: TimeInterval) {
    }
}
