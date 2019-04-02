import Foundation
import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene {
    //initalize
    var background : SKSpriteNode!
    var textureOfBackground = SKTexture(imageNamed: "fundo.jpg")
    
    //declare your screen scale
    var sceenScale = CGFloat(2)
    
    override public func didMove(to view: SKView) {
        //init the background with your texture and set your scale
        background = SKSpriteNode(texture: textureOfBackground)
        background.setScale(sceenScale)
        
        //set the transition of the background
        let moveBackground = SKAction.moveBy(x: -background.size.width * 2, y:0 , duration: 9)
        let repositionBackground = SKAction.moveBy(x: background.size.width * 2, y:0 , duration: 0)
       
        //declare the sequence
        let moveBackgroundForever = SKAction.repeatForever(SKAction.sequence([moveBackground, repositionBackground]))
        
        //Add 3 backgrounds in complementary positions
        for i in 0...2 {
            background = SKSpriteNode(texture: textureOfBackground)
            background.setScale(sceenScale)
            background.position = CGPoint(x: textureOfBackground.size().width * CGFloat(i) * sceenScale, y: 0)
            background.alpha = 0.75
            background.run(moveBackgroundForever)
            addChild(background)
        }
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
