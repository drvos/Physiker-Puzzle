//
//  AboutViewController.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 16.05.23.
//

import UIKit

class AboutViewController: UIViewController {
   
   @IBOutlet weak var appIconImage: UIImageView!
   @IBOutlet weak var appNameLabel: UILabel!
   @IBOutlet weak var appVersionLabel: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      print(String(format: "Name %@", Bundle.main.appName))
      print(String(format: "Bundle %@", Bundle.main.bundleId))
      print(String(format: "Version %@", Bundle.main.versionNumber))
      print(String(format: "Build %@", Bundle.main.buildNumber))
      
      appIconImage.image = UIImage(named: "AppIcon")
      appIconImage.layer.borderWidth = 1
      appIconImage.layer.borderColor = UIColor.black.cgColor
      appIconImage.layer.masksToBounds = false
      appIconImage.layer.cornerRadius = appIconImage.frame.width/2
      appIconImage.clipsToBounds = true
      
      appNameLabel.text = Bundle.main.appName
      appVersionLabel.text = String(format: "Version %@ (%@)", Bundle.main.versionNumber, Bundle.main.buildNumber)
   }
   
   // MARK: - IB Actions
   
   @IBAction func aboutCloseTapped(_ sender: UIBarButtonItem) {
      self.dismiss(animated: true)
   }
   @IBAction func aboutShareTapped(_ sender: UIBarButtonItem) {
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
