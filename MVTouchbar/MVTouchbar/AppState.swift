//
//  StatusBarViewModel.swift
//  MVTouchBar
//
//  Created by darsh on 28/11/20.
//

import Foundation
import Cocoa
import Combine

class AppState: ObservableObject {
    static let shared = AppState()
        
    var inputs = ["System Microphone", "To be Implemented"]
    @Published var selectedInput = 0
    
    var colorInputs = ["Teal", "To be Implemented"]
    var colors = [NSColor.systemTeal, NSColor.systemPink, NSColor.systemGreen, NSColor.systemYellow]
    
    @Published var selectedColor = 0
    
}
