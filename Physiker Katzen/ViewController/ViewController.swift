//
//  ViewController.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 13.05.23.
//

import UIKit

class ViewController: UIViewController, PuzzleDelegate, SettingsDelegate {

   @IBOutlet weak var appTitle: UINavigationItem!
   @IBOutlet weak var puzzleView: SlidingPuzzleView!
   
   let settings = Settings.shared
   let gameinfos = Gameinfo.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      print(String(format: "Name %@", Bundle.main.appName))
      print(String(format: "Bundle %@", Bundle.main.bundleId))
      print(String(format: "Version %@", Bundle.main.versionNumber))
      print(String(format: "Build %@", Bundle.main.buildNumber))
      
      puzzleView.delegate = self
      settings.delegate = self
      
      navigationItem.title = Bundle.main.appName
      navigationItem.rightBarButtonItem =
      UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain,
                      target: self, action: #selector(prefsTapped))
      puzzleView.puzzleImage = UIImage(named: "PuzzlePicture")
      puzzleView.layoutSubviews()
      self.startPuzzle()
   }
   
   func startPuzzle() {
      puzzleView.level = settings.puzzleLevel
      gameinfos.level = (settings.puzzleLevel).rawValue
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
      self.startPuzzle()
   }
}

// MARK: - Extension Bundle

extension Bundle {

    var appName: String {
        return infoDictionary?["CFBundleName"] as! String
    }

    var bundleId: String {
        return bundleIdentifier!
    }

    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }

    var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }

}
