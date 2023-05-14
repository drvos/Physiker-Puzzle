//
//  Settings.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 14.05.23.
//

import Foundation

protocol SettingsDelegate {
   func puzzleLevelSettingChanged(level: PuzzleLevel)
}

class Settings {
   
   private init(level: PuzzleLevel = .normal) {
      self.puzzleLevel = level
   }
   
   static let shared: Settings = { return Settings(level: .normal) }()
   
   var delegate: SettingsDelegate?
   
   // PuzzleLevel as PuzzleLevel (easy, normal, hard
   var puzzleLevel: PuzzleLevel {
      didSet {
         print("PuzzleLevelIs: \(puzzleLevel)")
         delegate?.puzzleLevelSettingChanged(level: puzzleLevel)
      }
   }
   
   func puzzleLevelAsSegmentIndex() -> Int {
      // To use in SegmentControl
      switch (self.puzzleLevel) {
         case .veryEasy:
            return -1
         case .easy:
            return 0
         case .normal:
            return 1
         case .hard:
            return 2
      }
   }
   
}
