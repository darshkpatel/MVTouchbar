//
//  AppDelegate.swift
//  MVTouchBar
//
//  Created by darsh on 24/11/20.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    let statusBarView = StatusBarView()
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.contentSize = NSSize(width: 360, height: 360)
//        popover.contentViewController = StatusBarViewController.freshController()
        popover.contentViewController = NSHostingController(rootView: statusBarView)
        // Create the Status Bar Item with the above Popover
        statusBar = StatusBarController.init(popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
