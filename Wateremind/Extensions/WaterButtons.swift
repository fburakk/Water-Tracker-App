//
//  WaterButtons.swift
//  Wateremind
//
//  Created by Burak Köse on 1.08.2022.
//

import Foundation
import UIKit

extension UIButton {
    
    func desing() {
        layer.masksToBounds = true
        layer.cornerRadius = 15
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 0.7
        
    }
}
