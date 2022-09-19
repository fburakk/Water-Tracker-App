//
//  ViewController.swift
//  Wateremind
//
//  Created by Burak Köse on 31.07.2022.
//

import UIKit
import WaveAnimationView
import RealmSwift

class ViewController: UIViewController {
    
     var waveManager = WaveManager()
     var realmManager = RealmManager()
    
     let devWidth = UIScreen.main.bounds.size.width
     let devHeight = UIScreen.main.bounds.size.height
    
    var goalWaterManager = GoalWaterManager()
    
    @IBOutlet weak var sButtonOut: UIButton!
    @IBOutlet weak var mButtonOut: UIButton!
    @IBOutlet weak var bButtonOut: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realmManager.getStats()
         
        waveManager.delegate = self
        waveManager.makeWave()
        
        goalWaterManager.delegate = self
        
        sButtonOut.desing()
        mButtonOut.desing()
        bButtonOut.desing()
     
        if K.Water.currentMl >= K.Water.goalMl {
            goalReached()
        }
        
    }
    
    @IBAction func waterButtonTouched(_ sender: UIButton) {
        
        if K.Water.currentMl < K.Water.goalMl {
            
            if let title = sender.titleLabel?.text {
                
                switch title {
                    
                case "200ml":
                    waveManager.upWave(upInput: K.Water.sButton)
                    
                case "300ml":
                    waveManager.upWave(upInput: K.Water.mButton)
                    
                case "500ml":
                    waveManager.upWave(upInput: K.Water.bButton)
                    
                default:
                    break
                }
            }
            
            realmManager.saveStats(valueInput: K.Water.currentMl, keyInput: "current")
        }
        
        if K.Water.currentMl >= K.Water.goalMl {
            goalReached()
        }
        
    }
    @IBAction func goalWaterButton(_ sender: Any) {
        goalWaterManager.openGoalField(vc: self)
    }
    
  // MARK: -Reached goal
    func goalReached() {
        infoLabel.text = "Done!"
        
        sButtonOut.isEnabled = false
        mButtonOut.isEnabled = false
        bButtonOut.isEnabled = false
        
        realmManager.saveStats(valueInput: true, keyInput: "completed")
        
    }
    
}

extension ViewController: WaveManagerDelegate {
    
    func fetchWave(_ wave: WaveAnimationView) {
        
        if let viewWithTag = self.view.viewWithTag(10) {
               viewWithTag.removeFromSuperview()
        }
        
        view.addSubview(wave)
        view.sendSubviewToBack(wave)
        
        
        infoLabel.text = "\(Double(K.Water.goalLiter))L / \(K.Water.currentMl)ml"
       
    }
    
}

extension ViewController: GoalWaterManagerDelegate {
    
    func updateStats() {
        
        infoLabel.text = "\(Double(K.Water.goalLiter))L / \(K.Water.currentMl)ml"
        sButtonOut.isEnabled = true
        mButtonOut.isEnabled = true
        bButtonOut.isEnabled = true
        
        waveManager.reset()
        
        realmManager.saveStats(valueInput: K.Water.goalMl, keyInput: "goal")
        realmManager.saveStats(valueInput: K.Water.currentMl, keyInput: "current")
    }
}
