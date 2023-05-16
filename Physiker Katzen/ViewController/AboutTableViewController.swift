//
//  AboutTableViewController.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 16.05.23.
//

import UIKit

class AboutTableViewController: UITableViewController {
   
   @IBOutlet weak var appNameLabel: UILabel!
   @IBOutlet weak var appVersionLabel: UILabel!
   @IBOutlet weak var appIconImageView: UIImageView!
   @IBOutlet weak var appDeveloperLabel: UILabel!
   @IBOutlet weak var appStoreRatingButton: UIButton!
   
   override func viewDidLoad() {
      super.viewDidLoad()
   
      print(String(format: "Name %@", Bundle.main.appName))
      print(String(format: "Bundle %@", Bundle.main.bundleId))
      print(String(format: "Version %@", Bundle.main.versionNumber))
      print(String(format: "Build %@", Bundle.main.buildNumber))
      
      appNameLabel.text = Bundle.main.appName
      appVersionLabel.text = String(format: "Version %@ (%@)", Bundle.main.versionNumber, Bundle.main.buildNumber)
      appDeveloperLabel.text = "Entwickelt von Volker Schering, 2023"
      appIconImageView.image = UIImage(named: "AppIcon")
      
   }
   @IBAction func appStoreRatingTouchUpInside(_ sender: UIButton) {
      let openAppStoreForRating = String(format: "itms-apps://itunes.apple.com/de/app/id%d", 6449164376)
      if (UIApplication.shared.canOpenURL(URL(string: openAppStoreForRating)!)) {
         UIApplication.shared.open(URL(string: openAppStoreForRating)!)
      } else {
         print("Cannot open AppStore")
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
