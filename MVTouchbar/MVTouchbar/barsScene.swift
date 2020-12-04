import Cocoa
import SpriteKit




class barsScene: SKScene {

    var ready = false
    let height : CGFloat = 30.0
    let wid : CGFloat = 10.0
    var setupDone = false
    var allNodes : [[SKSpriteNode]] = []
    var colorArr = [
        NSColor(red:0x12/255, green:0xc2/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x13/255, green:0xc1/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x15/255, green:0xc0/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x17/255, green:0xbf/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x19/255, green:0xbe/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x1a/255, green:0xbd/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x1c/255, green:0xbd/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x1e/255, green:0xbc/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x20/255, green:0xbb/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x22/255, green:0xba/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x23/255, green:0xb9/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x25/255, green:0xb9/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x27/255, green:0xb8/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x29/255, green:0xb7/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x2b/255, green:0xb6/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x2c/255, green:0xb5/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x2e/255, green:0xb4/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x30/255, green:0xb4/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x32/255, green:0xb3/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x34/255, green:0xb2/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x35/255, green:0xb1/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x37/255, green:0xb0/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x39/255, green:0xb0/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x3b/255, green:0xaf/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x3d/255, green:0xae/255, blue:0xe9/255, alpha:255/255),
        NSColor(red:0x3e/255, green:0xad/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x40/255, green:0xac/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x42/255, green:0xab/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x44/255, green:0xab/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x46/255, green:0xaa/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x47/255, green:0xa9/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x49/255, green:0xa8/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x4b/255, green:0xa7/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x4d/255, green:0xa7/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x4f/255, green:0xa6/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x50/255, green:0xa5/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x52/255, green:0xa4/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x54/255, green:0xa3/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x56/255, green:0xa2/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x58/255, green:0xa2/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x59/255, green:0xa1/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x5b/255, green:0xa0/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x5d/255, green:0x9f/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x5f/255, green:0x9e/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x61/255, green:0x9e/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x62/255, green:0x9d/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x64/255, green:0x9c/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x66/255, green:0x9b/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x68/255, green:0x9a/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x6a/255, green:0x99/255, blue:0xea/255, alpha:255/255),
        NSColor(red:0x6b/255, green:0x99/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x6d/255, green:0x98/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x6f/255, green:0x97/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x71/255, green:0x96/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x73/255, green:0x95/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x74/255, green:0x95/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x76/255, green:0x94/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x78/255, green:0x93/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x7a/255, green:0x92/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x7c/255, green:0x91/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x7d/255, green:0x90/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x7f/255, green:0x90/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x81/255, green:0x8f/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x83/255, green:0x8e/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x85/255, green:0x8d/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x86/255, green:0x8c/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x88/255, green:0x8c/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x8a/255, green:0x8b/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x8c/255, green:0x8a/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x8e/255, green:0x89/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x8f/255, green:0x88/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x91/255, green:0x87/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x93/255, green:0x87/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x95/255, green:0x86/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x97/255, green:0x85/255, blue:0xeb/255, alpha:255/255),
        NSColor(red:0x98/255, green:0x84/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0x9a/255, green:0x83/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0x9c/255, green:0x83/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0x9e/255, green:0x82/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xa0/255, green:0x81/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xa1/255, green:0x80/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xa3/255, green:0x7f/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xa5/255, green:0x7e/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xa7/255, green:0x7e/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xa9/255, green:0x7d/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xaa/255, green:0x7c/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xac/255, green:0x7b/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xae/255, green:0x7a/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xb0/255, green:0x7a/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xb2/255, green:0x79/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xb3/255, green:0x78/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xb5/255, green:0x77/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xb7/255, green:0x76/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xb9/255, green:0x75/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xbb/255, green:0x75/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xbc/255, green:0x74/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xbe/255, green:0x73/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xc0/255, green:0x72/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xc2/255, green:0x71/255, blue:0xec/255, alpha:255/255),
        NSColor(red:0xc4/255, green:0x71/255, blue:0xed/255, alpha:255/255)
      ]
    
    
    var created = false
    
    override func didMove(to view: SKView) { // Initialize all sprites for leveling
        print(self.size.width)
        if(!setupDone){
        self.backgroundColor = .black
        for i in 0...99 {
            var popul : [SKSpriteNode] = []
            for c in 0...10 {
//                if c < 2 {
//                    color = .systemBlue
//                }
        
                let x : CGFloat = (wid * CGFloat(i + 1)) // 110 aprox escape key distance
                var texture: SKTexture
                
                texture = SKTexture(imageNamed: "square") // TODO: Make this configurable by uset
                
                let rect = SKSpriteNode(texture: texture, color: colorArr[99-i], size: CGSize(width: wid, height: 3))
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
//            allNodes[group][i].color = self.color
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
