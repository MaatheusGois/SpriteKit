import Foundation
import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene {
    
    var fundo : SKSpriteNode!
    var textura = SKTexture(imageNamed: "fundo.jpg")
    var escalaTela = CGFloat(2)
    
    override public func didMove(to view: SKView) {
        fundo = SKSpriteNode(texture: textura)
        fundo.setScale(escalaTela)
        
        let moveFundo = SKAction.moveBy(x: -fundo.size.width * 2, y:0 , duration: 9)
        let reposicionaFundo = SKAction.moveBy(x: fundo.size.width * 2, y:0 , duration: 0)
        let moveFundoSempre = SKAction.repeatForever(SKAction.sequence([moveFundo, reposicionaFundo]))
        
        for i in 0...2 {
            fundo = SKSpriteNode(texture: textura)
            fundo.setScale(escalaTela)
            fundo.position = CGPoint(x: textura.size().width * CGFloat(i) * escalaTela, y: 0)
            fundo.alpha = 0.75
            fundo.run(moveFundoSempre)
            addChild(fundo)
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
