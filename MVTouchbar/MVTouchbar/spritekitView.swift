import Cocoa
import SpriteKit

class spritekitView: SKView {
    
    let skBarsScene = barsScene(size: CGSize(width: 1005, height: 30))
   
    func presentColor() {
        self.presentScene(skBarsScene)
    }

}
