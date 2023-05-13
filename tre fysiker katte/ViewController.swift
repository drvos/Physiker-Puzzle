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
   
   var timer: Timer?
   var duration: Duration?
   var secCount = 0
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      puzzleView.level = .veryEasy
      
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
      print("PuzzleComplete: Hurray")
      timer?.invalidate()
   }
   
   func puzzleSwapCount(view: SlidingPuzzleView, count: Int) {
      // print("PuzzleSwapCount: \(count)")
      if (count == 1) {
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(oneSecTimer), userInfo: nil, repeats: true)
      }
      gameInfoVC.lblMoves.text = "\(count)"
   }
   
   @objc func oneSecTimer() {
      print("OneSecTimer fired")
      secCount += 1
      duration = Duration.seconds(secCount)
      // "0:00:02"
      gameInfoVC.lblTime.text = duration!.formatted()
   }

}
