//
//  Constants.swift
//  Wateremind
//
//  Created by Burak Köse on 4.08.2022.
//

import Foundation
import UIKit
import RealmSwift

struct K {
    
    static let devWidth = UIScreen.main.bounds.size.width
    static let devHeight = UIScreen.main.bounds.size.height
    
    struct Wave {
       static var waveSize = 0
    }
    
    struct Water {
        
        static var goalLiter = 3
        
        static var goalMl : Int {
            return goalLiter * 1000
        }
        
        static var currentMl = 0
        
        static var sButton = 200
        static var mButton = 300
        static var bButton = 500
        
    }
    
}
