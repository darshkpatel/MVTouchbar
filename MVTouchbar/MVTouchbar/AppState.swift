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
        
    var inputs = ["System Microphone", "Other"]
    @Published var selectedInput = 0
    
    var colorInputs = ["Teal", "Pink", "Green", "Yellow"]
    var colors = [NSColor.systemTeal, NSColor.systemPink, NSColor.systemGreen, NSColor.systemYellow]
    
    @Published var selectedColor = 0
    
}
