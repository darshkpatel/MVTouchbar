import Cocoa
import SpriteKit

class barsScene: SKScene {
    
    var ready = false
    let height : CGFloat = 30.0
    let wid : CGFloat = 10.0
    var setupDone = false
    var allNodes : [[SKSpriteNode]] = []
    

    var created = false
    
    override func didMove(to view: SKView) { // Initialize all sprites for leveling
        print(self.size.width)
        if(!setupDone){
        self.backgroundColor = .black
        for i in 0...99 {
            var popul : [SKSpriteNode] = []
            for c in 0...10 {
                var color : NSColor!
//                if c < 2 {
//                    color = .systemBlue
//                }
                color = .systemTeal
        
                let x : CGFloat = (wid * CGFloat(i + 1)) // 110 aprox escape key distance
                var texture: SKTexture
                
                texture = SKTexture(imageNamed: "square") // TODO: Make this configurable by uset
                
                let rect = SKSpriteNode(texture: texture, color: color, size: CGSize(width: wid, height: 3))
                rect.colorBlendFactor = 1.0
                self.addChild(rect)
                rect.position = CGPoint(x: x, y: (rect.size.height * CGFloat(c - 1)) + (rect.size.height / 2))
                
                popul.append(rect)
            }
            allNodes.append(popul)
        }
        
        if !ready {
            self.backgroundColor = .black
            ready = true
        }
        
        if !created {
            created = true
            moveCent() //Correct call point?
        }
            setupDone = true
        }
    }
    
    
    func levelFor(group: Int, level: Int) {
        guard allNodes.count == 100 else { return }
        
        for i in 0...level { // Reveal all needed nodes
            if i > 10 {
                continue
            }
            allNodes[group][i].isHidden = false
        }
        
        if level < 10 {
            for i in (level + 1)...10 { // Hide all nodes below peak volume
                allNodes[group][i].isHidden = true
            }
        }
    }
    

    
    func moveCent() {
        for i in 0...99 {
            for j in 0...10 {
                let x : CGFloat = (wid * CGFloat(i + 1))
                allNodes[i][j].position = CGPoint(x: x, y: allNodes[i][j].position.y)
            }
        }
    }
    

}
