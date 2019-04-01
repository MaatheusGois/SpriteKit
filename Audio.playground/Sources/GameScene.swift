import Foundation
import PlaygroundSupport
import SpriteKit

public class GameScene: SKScene {
    // musica de fundo
    var musicaDeFundo = SKAction.playSoundFileNamed("music.mp3", waitForCompletion: true)
    // waitForCompletion == espera a musica acabar para gerar outra?
    var somClick = SKAction.playSoundFileNamed("hit.mp3", waitForCompletion: false)
    
    
    
    
    
    override public func didMove(to view: SKView) {

        let loopSom:SKAction = SKAction.repeatForever(musicaDeFundo)
        self.run(loopSom)
        
    }
    
    
    
    @objc static public override var supportsSecureCoding: Bool {
        get {
            return true
        }
    }
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        //Roda SOM ao clicar
        self.run(somClick)
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
