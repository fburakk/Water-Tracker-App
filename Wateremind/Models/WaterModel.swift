//
//  WaterModel.swift
//  Wateremind
//
//  Created by Burak Köse on 16.08.2022.
//

import Foundation
import UIKit
import RealmSwift

class Water: Object {
    
    @Persisted var goal = Double(K.Water.goalMl)
    @Persisted var current = Double(K.Water.currentMl)
    @Persisted var date = Date()
    @Persisted var completed = false
    
}
