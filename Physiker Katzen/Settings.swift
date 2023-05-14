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
      return self.puzzleLevel.rawValue - 3
   }
   
   func countPieces() -> Int {
      // To use in ConfigurationTable
      return Int(pow(CGFloat(self.puzzleLevel.rawValue), 2))
   }
   
}
