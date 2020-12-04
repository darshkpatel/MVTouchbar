//
//  Created by Addison Hanrattie on 4/24/19.
//  Copyright © 2019 Addison Hanrattie. All rights reserved.
//
import Cocoa
import AVFoundation
import Accelerate

public class volume {
    
    public var sampleRate = 0.0
    var trailingPeak : Float = 0.0000000001
    
    let col : spritekitView = spritekitView()
    
    public func analyze(buffer: AVAudioPCMBuffer) -> ([Int], Int) {
        // refrenced from stackoverflow.com/questions/3398753/using-the-apple-fft-and-accelerate-framework
        
        // Set Buffers
        let bufferSize = buffer.frameLength
        
        let sqLog = vDSP_Length(log2(Float(bufferSize)))
        var setup : FFTSetup? = vDSP_create_fftsetup(sqLog, FFTRadix(kFFTRadix2))! // Change value for
        
        let maxBufFloatL = Int(bufferSize / 2) * MemoryLayout<Float>.size
        
        // Set Comnplex
        var realp = (malloc(maxBufFloatL)?.assumingMemoryBound(to: Float.self))!
        var imagp = (malloc(maxBufFloatL)?.assumingMemoryBound(to: Float.self))!
        var complex = DSPSplitComplex(realp: realp, imagp: imagp)
        
        // Control Memory
        defer {
            vDSP_destroy_fftsetup(setup)
            realp.deallocate()
            imagp.deallocate()
        }

        // even odds
        let cPnt = buffer.audioBufferList.pointee.mBuffers.mData!.assumingMemoryBound(to: DSPComplex.self)
        let cPntLen = buffer.audioBufferList.pointee.mBuffers.mDataByteSize
        vDSP_ctoz(cPnt, 2, &complex, 1, vDSP_Length(bufferSize / 2))
        memset(cPnt, 0, Int(cPntLen))
        
        //fft and clear
        vDSP_fft_zrip(setup!, &complex, 1, sqLog, FFTDirection(FFT_FORWARD))
        bzero(complex.imagp, maxBufFloatL)
        
        var row : vDSP_Length = 0
        var vol : Float = 0.0
        vDSP_maxvi(complex.realp, 1, &vol, &row, vDSP_Length(bufferSize / 2))
        
        var peaks : [Float] = []
        
        let kDivCons : Float = 1.035 // kDivCons is a constant which can be tuned to affect of the relative loudness
        var topRng = 2205
        var btmRng = Int(Float(topRng) / kDivCons) //Constant^
        
        topRng = Int(Float(topRng) / kDivCons) //Constant^
        btmRng = Int(Float(topRng) / kDivCons) //Constant^
        
        for _ in 1...100 {
            var avgPeak : Float = 0.0
            vDSP_maxmgv((complex.realp + topRng), 1, &avgPeak, vDSP_Length(topRng - btmRng))
            
            
            topRng = Int(Float(topRng) / kDivCons) //Constant^
            btmRng = Int(Float(topRng) / kDivCons) //Constant^
            
            if avgPeak.isNaN {
                avgPeak = 0.0
            } else if avgPeak.isInfinite {
                avgPeak = 300.0
            }
            
            
            peaks.append(avgPeak)
        }
        
        // Getting peak audio value
        var peak : Float = 0.0
        vDSP_meamgv((complex.realp + topRng), 1, &peak, vDSP_Length(2205 - (Float(btmRng) * kDivCons)))
        if peak > trailingPeak {
            trailingPeak = peak
        }
//        if(peak.isNaN) {peak = 0.0}
        let method = 2 // TODO: Make configurable by user
        var finalPeaks : [Int] = []
        
        switch method { //switchs volume scale calculations
        case 0: // All volumes based off of max shifted downwards, no manipulation
            let shifter = 10.0 / (peaks.max() ?? 1.0)
            print(peaks.max() as Any, shifter)
            for i in 0...99 {
                if shifter.isInfinite || shifter.isNaN {
                    let peak = Int(peaks[i] * 0.0) + 1
                    finalPeaks.append(peak)
                } else {
                    let peak = Int(peaks[i] * shifter) + 1
                    finalPeaks.append(peak)
                }
            }
        case 1:
            let sortedPeaks = peaks.sorted()
            for i in 0...99 { // Each loudness level has equal number of frequencies
                let p = sortedPeaks.firstIndex(of: peaks[i])!
                do {
                    let relLoud =  10.0 * Float(p) / 99.0
                    var peakiness = Int(relLoud) + 1
                    if (!(peakiness >= 0 && peakiness <= 10)) {
                        peakiness = 0
                    }
                    finalPeaks.append(peakiness)
                }
            }
        case 2:
            let s = powf(peaks.max()!, 0.1)
            for i in 0...99 { // Number of frequencies in each loudness level varies logarithmically
                if peaks[i] == 0.0 {
                    finalPeaks.append(1)
                    continue
                }
                var peak = logA(x: peaks[i], ofBase: s)
                if(peak.isNaN){
                    peak = 1.0
                }
                if peak < 0.0 {
                    peak = 1.0
                }
                
                if peak > 10.0 {
                    peak = peak/10
                }
           
                finalPeaks.append(Int(peak))
            }
            print(finalPeaks)
        default:
            fatalError() //should never default
            break
        }
        
        //NTS: I have written a couple different ways of scalling the volume
        
        // Clear Data
        for ii in 0..<Int(buffer.audioBufferList.pointee.mNumberBuffers) {
            bzero(buffer.audioBufferList.pointee.mBuffers.mData! + ii, Int(buffer.audioBufferList.pointee.mBuffers.mDataByteSize))
        }

        return (finalPeaks, 0)
    }
    
    func logA(x: Float, ofBase b: Float) -> Float {
        return log(x)/log(b)
    }
}
