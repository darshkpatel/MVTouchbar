import Combine
import Accelerate
import AVFoundation

class AudioCapture: NSObject, ObservableObject {
    @Published private(set) var rms: Float = 0.02
    @Published var historyCursorAbsolute: Int = 0
    var historyCursor: Int {
        historyCursorAbsolute.quotientAndRemainder(dividingBy: historyLimit).remainder
    }

    lazy private(set) var rmsHistory: [Float] = Array(repeating: 0, count: historyLimit)

    var historyLimit: Int
    var historySampleDuration: Float

    private var lastSampleDate: Date = Date()
    private var rmsHistorySinceLastSample: [Float] = []
    private let audioEngine = AVAudioEngine()

    init(historyLimit: Int = 100, historySampleDuration: Float = 0.2, initialHistory: [Float]? = nil) {
        self.historyLimit = historyLimit
        self.historySampleDuration = historySampleDuration
        super.init()

        if let initialHistory = initialHistory {
            rmsHistory = initialHistory.suffix(historyLimit)
            historyCursorAbsolute = rmsHistory.count - 1
        }

        setupAudio()
        startAudio()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(configurationChanged),
            name: .AVAudioEngineConfigurationChange,
            object: nil)
    }

    private func useNew(rms: Float) {
        self.rms = rms
        if Date().timeIntervalSince(lastSampleDate) > Double(historySampleDuration) {
            let avg = sqrt(vDSP.mean(vDSP.square(rmsHistorySinceLastSample)))
            rmsHistory.remove(at: historyCursor)
            rmsHistory.insert(avg, at: historyCursor)
            rmsHistory = rmsHistory.suffix(historyLimit)
            lastSampleDate = Date()
            rmsHistorySinceLastSample.removeAll(keepingCapacity: true)
            historyCursorAbsolute += 1
        }
        rmsHistorySinceLastSample.append(rms)
    }

    // MARK: - Real

    @objc private func configurationChanged(notification: Notification) {
        setupAudio()
        startAudio()
    }

    private func setupAudio() {
        let node = audioEngine.inputNode
        node.removeTap(onBus: 0) // Remove existing tap first, since we might have already added one previously

        let recordingFormat = node.inputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { [weak self] (buffer, _) in
            DispatchQueue.main.async { [weak self] in
                let rms = vDSP.rootMeanSquare(buffer.firstChannel)
                self?.useNew(rms: rms)
            }
        }
    }

    private func startAudio() {
        do {
            try audioEngine.start()
        } catch {
            print("Failed to start audio engine.", error)
        }
    }

    private func stopAudio() {
        audioEngine.stop()
    }
}

extension AVAudioPCMBuffer {
    fileprivate var firstChannel: [Float] {
        guard let floatChannelData = floatChannelData else { return []}
        return Array(UnsafeBufferPointer(start: floatChannelData[0], count: Int(frameLength)))
    }
}

extension Float {
    private static var refRms: Float { 0.00001 }
    var dbSplFromRms: Float {
        20 * log10((max(self, .leastNonzeroMagnitude)) / .refRms)
    }
    var rmsFromDbSpl: Float {
        pow(10, self / 20) * .refRms
    }
}
extension Array where Element == Float {
    var dbSplFromRms: [Float] {
        map { $0.dbSplFromRms }
    }
}
