//
//  ViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit

class ViewController: UIViewController, PuzzleDelegate, SettingsDelegate {

   @IBOutlet weak var puzzleView: SlidingPuzzleView!
   
   let settings = Settings.shared
   let gameinfos = Gameinfo.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      puzzleView.delegate = self
      settings.delegate = self
      
      navigationItem.rightBarButtonItem =
      UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain,
                      target: self, action: #selector(prefsTapped))
      puzzleView.puzzleImage = UIImage(named: "PuzzlePicture")
      puzzleView.layoutSubviews()
      self.startPuzzle()
   }
   
   func startPuzzle() {
      puzzleView.level = settings.puzzleLevel
      puzzleView.swapAnimationDuration = settings.puzzleSwapAnimationDuration
      
      puzzleView.startPuzzle()
      puzzleView.shuffle()
   }
   
   @objc func prefsTapped() {
      self.performSegue(withIdentifier: "configurationSegue", sender: self)
   }
   
   // MARK: - PuzzleDelegate
   
   func puzzleComplete(view: SlidingPuzzleView) {
      print("PuzzleComplete: Hurray")
      Haptic.success.generate()
      self.performSegue(withIdentifier: "winSegue", sender: self)
      gameinfos.stop()
      puzzleView.shuffle()
   }
   
   func puzzleSwapCount(view: SlidingPuzzleView, count: Int) {
      print("PuzzleSwapCountIs: \(count)")
      gameinfos.moves = count
   }
   
   // MARK: - SettingsDelegate
   
   func puzzleLevelSettingChanged(level: PuzzleLevel) {
      print("PuzzleLevelSettingChanged \(level)")
      // DONE: Spiel stoppen und neu starten
      gameinfos.stop()
      gameinfos.reset()
   }
}
