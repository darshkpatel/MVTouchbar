import Cocoa
import AVFoundation
import Accelerate
import AudioToolbox
import SpriteKit
import CoreAudio



extension NSTouchBarItem.Identifier {
    static let mainTouchBarItem = NSTouchBarItem.Identifier("touchbarapps.MVTouchBar.visualizer.color")
}
extension NSTouchBar.CustomizationIdentifier {
    static let mainTouchBarCustomization = NSTouchBar.CustomizationIdentifier("touchbarapps.MVTouchBar.visualizer")
}


class ViewController: NSViewController {

    let audioEngine = AVAudioEngine()
    var vol : volume = volume()
    
    var colorSKView = spritekitView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear() {
        backGroundShow()
    }
    
    func updatePresence() {
        DFRElementSetControlStripPresenceForIdentifier(.mainTouchBarItem, true)
    }
    
    @objc func showTouchBar() {
        presentSystemModal(touchBar, systemTrayItemIdentifier: .mainTouchBarItem)
        updatePresence()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.colorSKView.presentColor()
        }
    }
    
    func backGroundShow() {
        DFRSystemModalShowsCloseBoxWhenFrontMost(false)
        let item = NSCustomTouchBarItem(identifier: .mainTouchBarItem)
        let nmg = NSImage(named: NSImage.Name("logo"))!
        item.view = NSButton(image: nmg, target: self, action: #selector(showTouchBar))
        NSTouchBarItem.addSystemTrayItem(item)
        updatePresence()
    }


    func setup(){
        
      
        let format = audioEngine.inputNode.outputFormat(forBus: 0)

        vol.sampleRate = audioEngine.inputNode.outputFormat(forBus: 0).sampleRate
        
        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { (buffer, time) in
            let levels = self.vol.analyze(buffer: buffer)
            for i in 0...99 {
                self.colorSKView.skBarsScene.levelFor(group: 99 - i, level: levels.0[i])
            }
            print(levels.1)

    

        }
        

        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print(error)
        }


    }

    func stop(){
        audioEngine.inputNode.removeTap(onBus: 0)
        audioEngine.stop()
        print("Stopping Audio Tap")
    }

}

@available(OSX 10.12.2, *)
extension ViewController: NSTouchBarDelegate {
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier = .mainTouchBarCustomization
        touchBar.defaultItemIdentifiers = [.mainTouchBarItem]
        touchBar.customizationAllowedItemIdentifiers = [.mainTouchBarItem]
        return touchBar
    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        
        let item = NSCustomTouchBarItem(identifier: .mainTouchBarItem)
        colorSKView = spritekitView()
        item.view = colorSKView

        return item
    }

    func presentSystemModal(_ touchBar: NSTouchBar!, systemTrayItemIdentifier identifier: NSTouchBarItem.Identifier!) {
        NSTouchBar.presentSystemModalTouchBar(touchBar, systemTrayItemIdentifier: identifier)    }

    func presentSystemModal(_ touchBar: NSTouchBar!, placement: Int64, systemTrayItemIdentifier identifier: NSTouchBarItem.Identifier!) {
        NSTouchBar.presentSystemModalTouchBar(touchBar, placement: placement, systemTrayItemIdentifier: identifier)
    }

    func minimizeSystemModal(_ touchBar: NSTouchBar!) {
        NSTouchBar.minimizeSystemModalTouchBar(touchBar)
    }
}

