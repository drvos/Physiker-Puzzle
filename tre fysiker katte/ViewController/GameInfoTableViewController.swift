//
//  GameInfoTableViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit
   
class GameInfoTableViewController: UITableViewController {
   
   @IBOutlet weak var movesLabel: UILabel!
   @IBOutlet weak var timeLabel: UILabel!
   
   var secCount: Int = 0
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.resetTime()
      self.resetCount()
   }
   
   func resetCount() {
      secCount = 0
      movesLabel.text = String(format: "%d", secCount)
   }
   
   func resetTime() {
      timeLabel.text = "0:00:00"
   }
   
}
