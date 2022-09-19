//
//  DailyVC.swift
//  Wateremind
//
//  Created by Burak Köse on 4.09.2022.
//

import UIKit
import RealmSwift

class DailyVC: UIViewController {

    var realmManager = RealmManager()
    var waterArray: Results<Water>?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        realmManager.delegate = self
        realmManager.getStats()
    }
    
    func goalH(goal:Double) -> CGFloat {
        
        if goal >= 3000 {
            return 170
            
        }else{
            return 170*goal/3000
        }
    }
    
    func currentH(current:Double,goal:Double) -> CGFloat {
        let h = goalH(goal: goal)*current/goal
        return h
    }
    
}
extension DailyVC: DailyStatsDelegate {
    
    func getDailyStats(water: Results<Water>) {
        waterArray = water
    }
}

extension DailyVC: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let waterIndex = waterArray![indexPath.row]
        let cDate = Calendar.current.dateComponents([.day, .year, .month], from: waterIndex.date)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DailyCollectionCell
        
        cell.goalView.layer.masksToBounds = true
        cell.goalView.layer.cornerRadius = 10
        cell.goalView.layer.borderWidth = 0.5
        cell.goalView.layer.borderColor = UIColor.black.cgColor
        
        cell.goalHeight.constant = goalH(goal: waterIndex.goal)
        cell.currentHeight.constant = currentH(current: waterIndex.current, goal: waterIndex.goal)
        
        cell.dayLabel.text = "\(cDate.day!)-\(cDate.month!)-\(cDate.year!)"
        cell.goalLabel.text = String(waterIndex.goal / 1000)
        cell.currentLabel.text = String(waterIndex.current / 1000)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return waterArray?.count ?? 0
    }
    
   
    
    
    
}
