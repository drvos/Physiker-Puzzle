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
   @IBOutlet weak var shareButton: UIButton!
   
   let app = App.shared
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      appDeveloperLabel.text = String(format: "%@, 2023", app.Developer)
      
   }
   
   // MARK: - IBActions
   
   @IBAction func appStoreRatingTapped(_ sender: UIButton) {
      let openAppStoreForRatingUrl = String(format: "itms-apps://itunes.apple.com/de/app/id%d", 6449164376)
      logger.trace("\(openAppStoreForRatingUrl)")
      if (UIApplication.shared.canOpenURL(URL(string: openAppStoreForRatingUrl)!)) {
         UIApplication.shared.open(URL(string: openAppStoreForRatingUrl)!)
      } else {
         logger.warning("Cannot open AppStore")
      }
   }
   @IBAction func shareButtonTapped(_ sender: UIButton) {
      logger.debug("Function shareButtonTapped")
      app.share()
   }
   
}
