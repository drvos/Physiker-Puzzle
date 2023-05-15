//
//  GameInfoTableViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit

class GameInfoTableViewController: UITableViewController, GameinfoDelegate {
   
   @IBOutlet weak var movesLabel: UILabel!
   @IBOutlet weak var timeLabel: UILabel!
   
   let gameinfo = Gameinfo.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      gameinfo.delegate = self
   }
   
   // MARK: - GameinfoDelegate
   
   func gameinfoMovesChanged(moves: Int) {
      print("gameinfoMoves: \(moves)")
      movesLabel.text = String(format: "%d", gameinfo.moves)
   }
   
   func gameinfoSecondsChanged(seconds: Int) {
      print("gameinfoSeconds: \(seconds)")
      timeLabel.text = gameinfo.secondsFormatted()
   }
   
   func gameinfoReset() {
   }
}
