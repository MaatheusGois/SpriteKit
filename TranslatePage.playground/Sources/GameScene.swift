import Foundation
import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene {
    //declara reiniciar como false
    var reiniciar = false
    
    
    override public func didMove(to view: SKView) {
        
    }
    
    @objc static public override var supportsSecureCoding: Bool {
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        //Colocar a condicao para reiniciar aqui
        reiniciar = true
    }
    
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if (reiniciar) {
            let transicao = SKTransition.doorway(withDuration: 1)
            let proximaCena:GameScene! = GameScene(fileNamed: "GameScene") as! GameScene
            self.view?.presentScene(proximaCena, transition: transicao)
            
            reiniciar = false
        }
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
