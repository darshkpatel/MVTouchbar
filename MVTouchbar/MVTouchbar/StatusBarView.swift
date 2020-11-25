//
//  StatusBarView.swift
//  MVTouchBar
//
//  Created by darsh on 24/11/20.
//

import SwiftUI

struct StatusBarView: View {
    @ObservedObject private var audioCapture = AudioCapture()
    
    @State var gaugeThickness: CGFloat = 13
    @State var gaugeGapWidth: CGFloat = 6
    @State var titleLabelKerning: CGFloat = 4
    @State var trimAnimationDuration: Double = 0.2
    @State var radarLineWidth: CGFloat = 2
    @State var radarDivisions: Int = 8

    
    var inputs = ["System Microphone", "Other"]
    @State private var selectedInput = 0

    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
//            Spacer()
         
                
            Text("Audio Input:")
            Picker(selection: $selectedInput, label: Text("Audio Input")) {
                       ForEach(0 ..< inputs.count) {
                          Text(self.inputs[$0])
                       }
                    }
            .pickerStyle(PopUpButtonPickerStyle())
            .labelsHidden()
            .frame(width: 200.0)
            
            
            AudioMeterView(config: .init(
                meter: .init()
                    )
            )
            .environmentObject(audioCapture)
            
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
        .touchBar(TouchBar(id: "touchbarapps.MVTouchBar") {
            Button("♣️", action: {})
            Button("♥️", action: {})
            Button("♠️", action: {})
            Button("♦️", action: {})
        })

    }
}


struct StatusBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatusBarView()
    }
}
