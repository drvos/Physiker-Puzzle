//
//  App.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 18.05.23.
//

import os
import UIKit
import Foundation

let app = App.shared
let logger = Logger(subsystem: app.BundleId, category: "Physiker-Puzzle")

class App {
   
   var Icon: UIImage
   
   var Name: String
   var Developer: String
   
   var BundleId: String
   var VersionNumber: String
   var BuildNumber: String
   
   var AppStoreId: String
   var AppStoreForRatingUrl: String
   
   init() {
      self.Icon = UIImage(named: "AppIcon")!
      self.Name = Bundle.main.appName
      self.BundleId = Bundle.main.bundleIdentifier!
      self.VersionNumber = Bundle.main.versionNumber
      self.BuildNumber = Bundle.main.buildNumber
      self.Developer = "Volker Schering"
      self.AppStoreId = "6449164376"
      self.AppStoreForRatingUrl = String(format: "itms-apps://itunes.apple.com/de/app/id%@", self.AppStoreId)
   }
   
   static let shared: App = { return App() }()
   
   func openShareSheet() {
      logger.debug("Function app.shareSheet")
   }
   
   func openAppStoreForRating() {
      logger.debug("Function app.appStoreRating")
      if (UIApplication.shared.canOpenURL(URL(string: self.AppStoreForRatingUrl)!)) {
         UIApplication.shared.open(URL(string: self.AppStoreForRatingUrl)!)
      } else {
         logger.warning("Cannot open AppStore")
      }
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
