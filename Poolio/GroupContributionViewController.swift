//
//  GroupContributionViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class GroupContributionViewController: UIViewController {
  @IBOutlet fileprivate var chanceImageView: UIImageView! { didSet {
    chanceImageView.image = UIImage.imageWith(color: UIColor(red: 255/255, green: 209/255, blue: 76/255, alpha: 1))
  }}
}
// MARK: - Life Cycle Methods
extension GroupContributionViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    tabBarController?.tabBar.isHidden = true
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    chanceImageView.layer.cornerRadius = chanceImageView.frame.height / 2
  }
}
