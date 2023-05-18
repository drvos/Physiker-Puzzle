//
//  AboutTableViewController.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 16.05.23.
//

import UIKit

class AboutTableViewController: UITableViewController {
   
   @IBOutlet weak var appDeveloperLabel: UILabel!
   @IBOutlet weak var appStoreRatingButton: UIButton!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      appDeveloperLabel.text = "Entwickelt von Volker Schering, 2023"
      
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
