//
//  RealmManager.swift
//  Wateremind
//
//  Created by Burak Köse on 21.08.2022.
//

import Foundation
import UIKit
import RealmSwift

protocol DailyStatsDelegate {
    
    func getDailyStats(water:Results<Water>)
}

struct RealmManager {
    var delegate: DailyStatsDelegate?
    
    let realm = try! Realm()
    var waterModel = Water()
    
    private var waveManager = WaveManager()
    
    func saveStats(valueInput:Any,keyInput:String) {
        
        let lastDate = realm.objects(Water.self).last?.date ?? Date()
        let water = realm.objects(Water.self).last
        
        do {
            
            try! realm.write {
                
                if Calendar.current.isDateInToday(lastDate) && realm.objects(Water.self).last != nil{
                    water?.setValue(valueInput, forKey: keyInput)
                    
                }else{
                    
                    waterModel.current = Double(K.Water.currentMl)
                    waterModel.goal = Double(K.Water.goalMl)
                    
                    realm.add(waterModel)
                }
            }
            
        }catch{
            print("Error")
        }
      
    }
    
    mutating func getStats() {
        
        let lastDate = realm.objects(Water.self).last?.date ?? Date()
        let waterStats = realm.objects(Water.self).last
        
        let water = realm.objects(Water.self)
        delegate?.getDailyStats(water: water)
        
        if Calendar.current.isDateInToday(lastDate) && realm.objects(Water.self).last != nil {
            
            K.Water.goalLiter = Int(waterStats?.goal ?? 0) /  1000
            K.Water.currentMl = Int(waterStats?.current ?? 0)
            
            K.Wave.waveSize = waveManager.encodeWaveSize(upInput: K.Water.currentMl)
            
            
        }else{
            print("hehe")
            
        }
    }
    
}
