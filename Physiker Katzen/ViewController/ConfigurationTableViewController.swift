//
//  ConfigurationTableViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit

class ConfigurationTableViewController: UITableViewController {

   @IBOutlet weak var puzzleLevelSegment: UISegmentedControl!
   @IBOutlet weak var puzzleLevelLabel: UILabel!
   
   let settings = Settings.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      puzzleLevelSegment.selectedSegmentIndex = settings.puzzleLevelAsSegmentIndex()
      puzzleLevelLabel.text = String(format: "%d Teile", settings.countPieces())
   }
   
   @IBAction func segmentPuzzleLevel(_ sender: UISegmentedControl) {
      let segmentIndex = Int(puzzleLevelSegment.selectedSegmentIndex)
      
      logger.debug("SegmentPuzzleLevel: \(segmentIndex)")
      
      switch (puzzleLevelSegment.selectedSegmentIndex) {
         case 0: // einfach
            settings.puzzleLevel = .easy
            logger.trace("puzzleLevel: .easy")
         case 1: // normalÇ
            settings.puzzleLevel = .normal
            logger.trace("puzzleLevel: .normal")
         case 2: // schwer
            settings.puzzleLevel = .hard
            logger.trace("puzzleLevel: .hard")
         default:
            settings.puzzleLevel = .veryEasy
            logger.trace("puzzleLevel: .veryEasy")
      }
      puzzleLevelLabel.text = String(format: "%d Teile", settings.countPieces())
   }
}
