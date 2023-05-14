//
//  ViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit

class ViewController: UIViewController, PuzzleDelegate, SettingsDelegate {

   @IBOutlet weak var puzzleView: SlidingPuzzleView!
   
   var configurationViewController: ConfigurationViewController!
   var gameInfoTableViewController: GameInfoTableViewController!
   
   let settings = Settings.shared
   
   var timer: Timer?
   var duration: Duration?
   var secCount = 0
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      puzzleView.delegate = self
      settings.delegate = self
      
      navigationItem.rightBarButtonItem =
      UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain,
                      target: self, action: #selector(prefsTapped))
      
      puzzleView.puzzleImage = UIImage(named: "tre_fysiker_katte")
      
      self.startPuzzle()
   }
   
   func startPuzzle() {
      puzzleView.level = settings.puzzleLevel
      
      puzzleView.startPuzzle()
      puzzleView.shuffle()
   }
   
   func stopPuzzle() {
      self.timer?.invalidate()
   }
   
   func restartPuzzle() {
      self.stopPuzzle()
      self.startPuzzle()
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if (segue.destination .isKind(of: ConfigurationViewController.self)) {
         configurationViewController = segue.destination as? ConfigurationViewController
      } else if (segue.destination .isKind(of: GameInfoTableViewController.self)) {
         gameInfoTableViewController = segue.destination as? GameInfoTableViewController
      }
   }
   
   @objc func prefsTapped() {
      self.performSegue(withIdentifier: "configurationSegue", sender: self)
   }
   
   // MARK: - PuzzleDelegate
   
   func puzzleComplete(view: SlidingPuzzleView) {
      print("PuzzleComplete: Hurray")
      self.stopPuzzle()
   }
   
   func puzzleSwapCount(view: SlidingPuzzleView, count: Int) {
      print("PuzzleSwapCountIs: \(count)")
      if (count == 1) {
         print("Game started")
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(oneSecTimer), userInfo: nil, repeats: true)
      }
      gameInfoTableViewController.lblMoves.text = "\(count)"
   }
   
   @objc func oneSecTimer() {
      print("OneSecTimer fired")
      secCount += 1
      duration = Duration.seconds(secCount)
      // "0:00:02"
      gameInfoTableViewController.lblTime.text = duration!.formatted()
   }
   
   // MARK: - SettingsDelegate
   
   func puzzleLevelSettingChanged(level: PuzzleLevel) {
      print("PuzzleLevelSettingChanged \(level)")
      // TODO: Spiel stoppen und neu starten
      restartPuzzle()
   }

}
