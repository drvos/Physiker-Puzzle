//
//  ConfigurationTableViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit

class ConfigurationTableViewController: UITableViewController {
 
   var delegate: configurationTableViewControllerDelegate!

   @IBOutlet weak var puzzleLevelSegment: UISegmentedControl!
   @IBOutlet weak var puzzleLevelLabel: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   @IBAction func segmentPuzzleLevel(_ sender: UISegmentedControl) {
      let segmentIndex = Int(puzzleLevelSegment.selectedSegmentIndex)
      print("SegmentPuzzleLevel: \(segmentIndex)")
      var puzzleLevel: PuzzleLevel
      switch (puzzleLevelSegment.selectedSegmentIndex) {
         case 0: // einfach
            puzzleLevelLabel.text = "wenig Teile"
            puzzleLevel = .easy
         case 1: // normal
            puzzleLevelLabel.text = "normale Teile"
            puzzleLevel = .normal
         case 2: // schwer
            puzzleLevelLabel.text = "viele Teile"
            puzzleLevel = .hard
         default:
            puzzleLevelLabel.text = "Hö?"
            puzzleLevel = .veryEasy
      }
      delegate?.puzzleLevelChanged(puzzleLevel: puzzleLevel)
   }
}

protocol configurationTableViewControllerDelegate {
   func puzzleLevelChanged(puzzleLevel: PuzzleLevel)
}
