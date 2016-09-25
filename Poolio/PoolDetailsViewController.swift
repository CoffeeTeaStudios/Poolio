//
//  PoolDetailsViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class PoolDetailsViewController: UIViewController {
  @IBOutlet fileprivate var teamImageView: UIImageView! { didSet {
    teamImageView.image = UIImage.imageWith(color: .groupTableViewBackground)
  }}
  
  @IBOutlet fileprivate var chanceImageView: UIImageView! { didSet {
    chanceImageView.image = UIImage.imageWith(color: UIColor(red: 255/255, green: 79/255, blue: 76/255, alpha: 1))
  }}
}

// MARK: - Life Cycle Methods
extension PoolDetailsViewController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tabBarController?.tabBar.isHidden = true
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    teamImageView.layer.cornerRadius = teamImageView.frame.height / 2
    chanceImageView.layer.cornerRadius = chanceImageView.frame.height / 2
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    tabBarController?.tabBar.isHidden = false
  }
}

// MARK: - SegueHandlerType
extension PoolDetailsViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case groupContribution
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .groupContribution:
      break
    }
  }
}

// MARK: - @IBActions
private extension PoolDetailsViewController {
  @IBAction func requestButtonTapped() {
    performSegue(withIdentifier: .groupContribution, sender: nil)
  }
}
