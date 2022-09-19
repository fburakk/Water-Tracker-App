//
//  GoalWaterManager.swift
//  Wateremind
//
//  Created by Burak Köse on 13.08.2022.
//

import Foundation
import UIKit

protocol GoalWaterManagerDelegate {
    func updateStats()
}

struct GoalWaterManager {
    var delegate: GoalWaterManagerDelegate?
    
    func openGoalField(vc: UIViewController) {
        
        let alert = UIAlertController(title: "💧", message: "Please write your daily water goal ", preferredStyle: .alert)
        
        alert.addTextField { UITextField in
            UITextField.placeholder = "3L"
            UITextField.keyboardType = .numberPad
        }
        
        let okButton = UIAlertAction(title: "Ok", style: .default) { UIAlertAction in
            
            let lField = alert.textFields![0] as UITextField
            
            
            if let L = lField.text as? String {
                
                if lField.text == "" {
                    K.Water.goalLiter = 3
                    
                }else{
                    K.Water.goalLiter = Int(L) ?? 3
                }
            }
            
            delegate?.updateStats()
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        
        
        vc.present(alert, animated: true)
        
    }
}
