import Foundation
import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene {
    //initialize
    var felpudo:SKSpriteNode!
    var arrayImagensFelpudo:[SKTexture] = []
    
    override public func didMove(to view: SKView) {
        //create felpudo
        felpudo = SKSpriteNode(imageNamed: "Animate0")
        
        
        //You can add more Animate to the sequence
        for i in 0...1{
            arrayImagensFelpudo.append(SKTexture(imageNamed: "Animate\(i)"))
            print(i)
        }
        
        //you create the action
        var animate = SKAction.animate(with: arrayImagensFelpudo, timePerFrame: 1)
        
        //declare the sequence as infinit
        felpudo.run(.repeatForever(animate))
        
        //add felpudo to screen
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
