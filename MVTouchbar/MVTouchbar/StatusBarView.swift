//
//  StatusBarView.swift
//  MVTouchBar
//
//  Created by darsh on 24/11/20.
//

import SwiftUI

struct StatusBarView: View {
   
    @EnvironmentObject private var appState: AppState


    var body: some View {
        VStack(spacing: 10) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
         
                
            Text("Audio Input:")
            Picker(selection: $appState.selectedInput, label: Text("Audio Input")) {
                ForEach(0 ..< appState.inputs.count) {
                          Text(appState.inputs[$0])
                       }
                    }
            .pickerStyle(PopUpButtonPickerStyle())
            .labelsHidden()
            .frame(width: 200.0)
            
            Spacer()
            
            Text("Pick Color Theme:")
            Picker(selection: $appState.selectedColor, label: Text("Pick Color Theme")) {
                ForEach(0 ..< appState.colorInputs.count) {
                    Text(appState.colorInputs[$0])
                       }
                    }
            .pickerStyle(PopUpButtonPickerStyle())
            .labelsHidden()
            .frame(width: 200.0)
  
            Spacer()
            Button(action: {
                NSApplication.shared.terminate(self)
            })
            {
                Text("Quit App")
                .fontWeight(.semibold)
            }
            .frame(width: 360.0)
        }
        .padding(10)
        .frame(width: 360.0, height: 360.0, alignment: .top)

    }
}


struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}

