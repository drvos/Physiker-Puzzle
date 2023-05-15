//
//  WinViewController.swift
//  Physiker Katzen
//
//  Created by Volker Schering on 14.05.23.
//

import UIKit

class WinViewController: UIViewController {
   
   @IBOutlet weak var winImageView: UIImageView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.winImageView.image = UIImage(named: "PuzzlePicture")
      
   }
}
