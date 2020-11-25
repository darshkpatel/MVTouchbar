import SwiftUI

extension Float {
    func clamped(in range: ClosedRange<Self>) -> Self {
        max(range.lowerBound, min(self, range.upperBound))
    }
}
extension Float {
    var normalizedDbFromRms: Float {
        ((dbSplFromRms - 12) / (120-12)).clamped(in: 0...1)
    }
}
extension Array where Element == Float {
    var normalizedDbFromRms: [Float] {
        map { $0.normalizedDbFromRms }
    }
}

struct AudioPeakMeterView: View {
    @EnvironmentObject var audioCapture: AudioCapture

    var config: Config
    struct Config {
        var selectedColor: Color = .accentColor
        var unselectedColor: Color = Color.secondary.opacity(0.3)
    }

    private var normalizedVolume: CGFloat {
        CGFloat(audioCapture.rms.normalizedDbFromRms)
    }


    var body: some View{
            Group {
                SegmentedProgressView(value: Int(normalizedVolume*10))
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity)
        
    };


}

struct AudioMeterView: View {
    @EnvironmentObject var audioCapture: AudioCapture

    var config: Config = .init()
    struct Config {
        var meter: AudioPeakMeterView.Config = .init()
    }

    var body: some View {
        ZStack {
            AudioPeakMeterView(config: config.meter)
        }
        .padding([.leading, .trailing], 20)
    }

}


struct AudioMeterView_Previews: PreviewProvider {
    static let audioCapture = AudioCapture(historyLimit: 100, historySampleDuration: 0.6)
    
    static var previews: some View {
        Group {
            AudioMeterView()
                .padding()
                .background(Color.black)
                .previewDisplayName("Dark Mode")

            AudioMeterView()
                .padding()
                .environment(\.colorScheme, .light)
                .background(Color.white)
                .previewDisplayName("Light Mode")
        }
        .previewLayout(.sizeThatFits)
        .environmentObject(audioCapture)
    }
}
