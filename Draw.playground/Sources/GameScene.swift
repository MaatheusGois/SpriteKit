import Foundation
import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene {
    
    var path:CGMutablePath!
    var line:SKShapeNode!
    
    override public func didMove(to view: SKView) {
        backgroundColor = .black
    }
    
    @objc static public override var supportsSecureCoding: Bool {
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        //Starting the path
        path = CGMutablePath()
        //Start point
        path.move(to: pos)
        
        //Creating the Shape that follows the path and setting its properties
        line = SKShapeNode()
        line.strokeColor = .white
        line.lineWidth = 2
        addChild(line)
        
        //Saying which path it'll follow
        line.path = path
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        //Points after the start
        path.addLine(to: pos)
        //Updating the path to follow
        line.path = path
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
