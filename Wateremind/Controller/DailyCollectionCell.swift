//
//  DailyCollectionCell.swift
//  Wateremind
//
//  Created by Burak Köse on 4.09.2022.
//

import UIKit

class DailyCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var goalView: UIView!
    @IBOutlet weak var currentView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    
    @IBOutlet weak var goalHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var currentHeight: NSLayoutConstraint!
    
}
