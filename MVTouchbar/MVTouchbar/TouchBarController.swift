//
//  TouchBarController.swift
//
//  Copyright (C) 2017  Xander Deng
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

import Cocoa
import TouchBarHelper



extension NSTouchBarItem.Identifier {
    
    static let visualizer = NSTouchBarItem.Identifier("touchbarapps.MVTouchBar.touchBar.musicBars")

    
    static let systemTrayItem = NSTouchBarItem.Identifier("touchbarapps.MVTouchBar.touchBar.systemTrayItem")
}

extension NSTouchBar.CustomizationIdentifier {
    static let mainTouchBar = NSTouchBar.CustomizationIdentifier("touchbarapps.MVTouchBar")
}


class TouchBarController: TouchBarSystemModalController {
    
    static let shared = TouchBarController()
    
    weak var visualizer: visualizerItem?


    
    override func touchBarDidLoad() {
        touchBar?.customizationIdentifier = .mainTouchBar
        touchBar?.defaultItemIdentifiers = [.visualizer]
        touchBar?.customizationAllowedItemIdentifiers = [.visualizer]
        touchBar?.customizationRequiredItemIdentifiers = []
        
        systemTrayItem = NSCustomTouchBarItem(identifier: .systemTrayItem)
        systemTrayItem?.view = NSButton(image: #imageLiteral(resourceName: "logo"), target: self, action: #selector(presentTouchBar))
    }
    

    
    // TODO: customization point
    @objc private func presentTouchBar() {
        present()
    }
    

    // MARK: - NSTouchBarDelegate
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case .visualizer:
            let visualizer = visualizerItem(identifier: identifier)
            visualizer.customizationLabel = "Music Visualizer"
            self.visualizer = visualizer
            return visualizer
    
        default:
            return nil
        }
    }
    
}
