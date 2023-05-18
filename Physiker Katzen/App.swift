//
//  App.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 18.05.23.
//

import os
import UIKit
import Foundation

let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "Physiker-Puzzle")

class App {
   
   var Icon: UIImage
   var Name: String
   var Developer: String
   
   init() {
      self.Icon = UIImage(named: "AppIcon")!
      self.Name = Bundle.main.appName
      
      self.Developer = "Volker Schering"
   }
   
   static let shared: App = { return App() }()
   
   func share() {
      logger.debug("Function appShare")

   }
}

// MARK: - Extension Bundle

extension Bundle {
    var appName: String {
        return infoDictionary?["CFBundleName"] as! String
    }
/*
   var bundleId: String {
        return bundleIdentifier!
    }
    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }
    var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }
*/
}
