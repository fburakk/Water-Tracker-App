//
//  WaveManager.swift
//  Wateremind
//
//  Created by Burak Köse on 1.08.2022.
//

import Foundation
import UIKit
import WaveAnimationView

protocol WaveManagerDelegate {
    func fetchWave(_ wave: WaveAnimationView)
}

struct WaveManager {
    
    private var wave: WaveAnimationView!
    
    var delegate: WaveManagerDelegate?
    
    mutating func makeWave() {
        
        wave = WaveAnimationView(frame: CGRect(x: 0, y: Int(K.devHeight) - (K.Wave.waveSize * 2), width: Int(K.devWidth), height: K.Wave.waveSize * 2), frontColor: UIColor.systemCyan.withAlphaComponent(0.7), backColor: UIColor.systemCyan)
       
       wave.tag = 10
       delegate?.fetchWave(wave)
       wave.startAnimation()
        
    }
    
    mutating func upWave(upInput:Int) {
        
        K.Water.currentMl += upInput
        K.Wave.waveSize += encodeWaveSize(upInput: upInput)
        makeWave()
    }
    
    func encodeWaveSize(upInput:Int) -> Int {
        
        return Int(K.devHeight) * upInput / (K.Water.goalLiter * 1000)
    }
    
   mutating func reset() {
       
        K.Water.currentMl = 0
        K.Wave.waveSize = 0
       
        makeWave()
    }
    
}
