//
//  Gameinfos.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 15.05.23.
//

import Foundation

protocol GameinfoDelegate {
   func gameinfoMovesChanged(moves: Int)
   func gameinfoSecondsChanged(seconds: Int)
   func gameinfoReset()
}

class Gameinfo {
   
   private init() {
      self.level = 0
      self.moves = 0
      self.seconds = 0
   }
   
   static let shared: Gameinfo = { return Gameinfo() }()
   
   var delegate: GameinfoDelegate?
   var timer: Timer?
   
   var moves: Int {
      didSet {
         logger.debug("Moves: \(self.moves)")
         if (self.moves == 1) {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(oneSecTimer), userInfo: nil, repeats: true)
         }
         delegate?.gameinfoMovesChanged(moves: self.moves)
      }
   }
   var seconds: Int {
      didSet {
         logger.debug("Seconds: \(self.seconds)")
         delegate?.gameinfoSecondsChanged(seconds: self.seconds)
      }
   }
   var level: Int {
      didSet {
         logger.debug("Level: \(self.level)")
      }
   }
   
   @objc private func oneSecTimer() {
      logger.trace("OneSecTimer fired")
      self.seconds += 1
   }

   // MARK: -
   
   func stop() {
      timer?.invalidate()
   }
   
   func reset() {
      self.level = 0
      self.moves = 0
      self.seconds = 0
      delegate?.gameinfoReset()
   }
   
   // MARK: -
   
   func secondsFormatted() -> String {
      // "0:00:02"
      return Duration.seconds(self.seconds).formatted()
   }
   
   func levelFormatted() -> String {
      // To show Puzzle Level
      switch (self.level) {
         case 2:
            return "Sehr leicht"
         case 3:
            return "Leicht"
         case 4:
            return "Normal"
         case 5:
            return "Schwer"
         default:
            return "Unbekannt"
      }
   }
}
