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
   }
   
   @IBAction func segmentPuzzleLevel(_ sender: UISegmentedControl) {
      let segmentIndex = Int(puzzleLevelSegment.selectedSegmentIndex)
      print("SegmentPuzzleLevel: \(segmentIndex)")
      switch (puzzleLevelSegment.selectedSegmentIndex) {
         case 0: // einfach
            puzzleLevelLabel.text = "wenig Teile"
            settings.puzzleLevel = .easy
         case 1: // normal
            puzzleLevelLabel.text = "normale Teile"
            settings.puzzleLevel = .normal
         case 2: // schwer
            puzzleLevelLabel.text = "viele Teile"
            settings.puzzleLevel = .hard
         default:
            puzzleLevelLabel.text = "Hö?"
            settings.puzzleLevel = .veryEasy
      }
   }
}
