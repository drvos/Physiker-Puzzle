//
//  ViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit

class ViewController: UIViewController, PuzzleDelegate {
   
   @IBOutlet weak var puzzleView: SlidingPuzzleView!
   
   var gameInfoVC: GameInfoTableViewController!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      puzzleView.level = .easy
      
      puzzleView.puzzleImage = UIImage(named: "tre_fysiker_katte")
      
      puzzleView.delegate = self
      
      puzzleView.startPuzzle()
      puzzleView.shuffle()
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if (segue.identifier == "gameInfoSegue") {
         gameInfoVC = segue.destination as? GameInfoTableViewController
      }
   }
   
   // MARK: - PuzzleDelegate
   
   func puzzleComplete(view: SlidingPuzzleView) {
      
   }
   
   func puzzleSwapCount(view: SlidingPuzzleView, count: Int) {
      // print("PuzzleSwapCount: \(count)")
      gameInfoVC.lblMoves.text = "\(count)"
   }

}
