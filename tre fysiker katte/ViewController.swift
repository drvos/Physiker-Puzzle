//
//  ViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit

class ViewController: UIViewController, PuzzleDelegate {

   @IBOutlet weak var puzzleView: SlidingPuzzleView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      puzzleView.level = .normal
      
      puzzleView.puzzleImage = UIImage(named: "tre_fysiker_katte")
      
      puzzleView.delegate = self
      
      puzzleView.startPuzzle()
      puzzleView.shuffle()
   }
   
   // MARK: - PuzzleDelegate
   
   func puzzleComplete(view: SlidingPuzzleView) {
      
   }
   
   func puzzleSwapCount(view: SlidingPuzzleView, count: Int) {
      
   }
   
}

