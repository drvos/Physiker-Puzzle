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
      self.puzzleSwapAnimationDuration = 0.2
   }
   
   static let shared: Settings = { return Settings(level: .normal) }()
   
   var delegate: SettingsDelegate?
   
   // PuzzleLevel as PuzzleLevel (easy, normal, hard
   var puzzleLevel: PuzzleLevel {
      didSet {
         print("PuzzleLevel: \(puzzleLevel)")
         delegate?.puzzleLevelSettingChanged(level: puzzleLevel)
      }
   }
   var puzzleSwapAnimationDuration: Double
   
   func puzzleLevelAsSegmentIndex() -> Int {
      // To use in SegmentControl
      return self.puzzleLevel.rawValue - 3
   }
   
   func countPieces() -> Int {
      // To use in ConfigurationTable
      return Int(pow(CGFloat(self.puzzleLevel.rawValue), 2))
   }
   
}
