//
//  StatusBarView.swift
//  MVTouchBar
//
//  Created by darsh on 24/11/20.
//

import Cocoa

class StatusBarViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}



extension StatusBarViewController {
  // MARK: Storyboard instantiation
  static func freshController() -> StatusBarViewController {
    let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
    let identifier = NSStoryboard.SceneIdentifier("StatusBarViewController")
    guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? StatusBarViewController else {
      fatalError("StatusBarViewController Missing - Check Main.storyboard")
    }
    return viewcontroller
  }
}
