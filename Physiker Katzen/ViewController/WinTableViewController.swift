//
//  WinTableViewController.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 14.05.23.
//

import UIKit

class WinTableViewController: UITableViewController {
     
   @IBOutlet weak var winMovesLabel: UILabel!
   @IBOutlet weak var winTimeLabel: UILabel!
   
   let gameinfo = Gameinfo.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()

      winMovesLabel.text = String(format: "%d", gameinfo.moves)
      winTimeLabel.text = gameinfo.secondsFormatted()
   }
   
}
