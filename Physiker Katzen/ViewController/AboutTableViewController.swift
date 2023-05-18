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
      logger.debug("Function appStoreRatingTapped")
      app.openAppStoreForRating()
   }
   @IBAction func shareButtonTapped(_ sender: UIButton) {
      logger.debug("Function shareButtonTapped")
      app.openShareSheet()
   }
   
}
