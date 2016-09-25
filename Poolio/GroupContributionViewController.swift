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
    chanceImageView.image = UIImage.imageWith(color: UIColor(red: 255/255, green: 79/255, blue: 76/255, alpha: 1))
  }}
  
  @IBOutlet fileprivate var contributionTextField: UITextField! { didSet {
    contributionTextField.becomeFirstResponder()
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

// MARK: - @IBActions
private extension GroupContributionViewController {
  @IBAction func requestButtonTapped() {
    let contribution = Int(contributionTextField.text!)
    
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "contribution"), object: self, userInfo: ["contribution": contribution])
    _ = navigationController?.popToRootViewController(animated: true)
  }
  
  @IBAction func cancelButtonTapped() {
    _ = navigationController?.popViewController(animated: true)
  }
}
