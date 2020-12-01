import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let vc : ViewController = ViewController()

    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    let statusBarView = StatusBarView()
    let appState = AppState()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
       
        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.contentSize = NSSize(width: 360, height: 360)
        popover.contentViewController = NSHostingController(rootView: statusBarView.environmentObject(appState))
        
        // Create the Status Bar Item with the above Popover
        statusBar = StatusBarController.init(popover)
        
        
        //Touchbar
        if #available(OSX 10.12.2, *) {
            NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
        }
        

   
            
    
    }

    func applicationWillTerminate(_ aNotification: Notification) {

        vc.stop()
        print("closed")

    }
}

