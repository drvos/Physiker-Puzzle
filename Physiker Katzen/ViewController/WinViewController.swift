//
//  WinViewController.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 14.05.23.
//

import UIKit

class WinViewController: UIViewController {
   
   @IBOutlet weak var winImageView: UIImageView!
   @IBOutlet weak var winCrownImageView: UIImageView!
   
   let app = App.shared
   let gameinfo = Gameinfo.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.winImageView.image = UIImage(named: "PuzzlePicture")
      self.winCrownImageView.image = UIImage(named: "CrownPicture")
   }
   
   override func viewWillDisappear(_ animated: Bool) {
      logger.trace("WinViewController::WinViewWillDisappear")
      gameinfo.reset()
   }
   
   // MARK: - IB Action
   
   @IBAction func shareWinTapped(_ sender: UIBarButtonItem) {
      let timeText = String(format: "Hurray! Puzzle gelöst in %@.", gameinfo.secondsFormatted())
      let levelText = String(format: "Schwierigkeit: %@", gameinfo.levelFormatted())
      let movesText = String(format: "Benötigte Spielzüge: %d", gameinfo.moves)
      let img = UIImage(named: "PuzzlePicture")
      let share = [timeText, levelText, movesText, img!] as [Any]
      app.openShareSheet(sender: self, share: share)
   }
   
}
