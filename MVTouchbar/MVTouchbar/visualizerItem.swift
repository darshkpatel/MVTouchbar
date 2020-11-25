//
//  visualizerItem.swift
//  MVTouchBar
//
//  Created by darsh on 25/11/20.
//

import Cocoa

class visualizerItem: NSCustomTouchBarItem {
    override init(identifier: NSTouchBarItem.Identifier) {
        super.init(identifier: identifier)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {

        view = NSButton(title: "Test", target: self, action: nil)
        
   
    }
}
