//
//  InitialViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class InitialViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    FirebaseManager.sharedInstance.installPot()
  }
  
  @IBAction func buttonTapped() {
  }
}
