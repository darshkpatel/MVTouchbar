//
//  StatusBarViewModel.swift
//  MVTouchBar
//
//  Created by darsh on 28/11/20.
//

import Foundation
class StatusBarViewModel: ObservableObject {
    var inputs = ["System Microphone", "Other"]
    @Published var selectedInput = 0
    
    var colorInputs = ["Teal", "Pink", "Green", "Yellow"]
    var colors = [NSColor.systemTeal, NSColor.systemPink, NSColor.systemGreen, NSColor.systemYellow]
    @Published var colorSelectedInput = 0
    
}
