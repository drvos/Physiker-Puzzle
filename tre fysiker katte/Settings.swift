//
//  Settings.swift
//  tre fysiker katte
//
//  Created by Volker Schering on 14.05.23.
//

import Foundation

class Settings {

   static let shared: Settings = {
      let instance = Settings(level: .normal)
      // setup code
      return instance
   }()
   
   internal init(level: PuzzleLevel = .normal) {
      self.puzzleLevel = level
   }
   
   // PuzzleLevel 3-5
   var puzzleLevel: PuzzleLevel {
      didSet {
         print("PuzzleLevelIs: \(puzzleLevel)")
      }
   }
   
}
