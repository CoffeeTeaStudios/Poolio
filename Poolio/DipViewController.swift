//
//  DipViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class DipViewController: UIViewController {
  @IBOutlet fileprivate var progressView: UIView!
  @IBOutlet fileprivate var progressBarConstraint: NSLayoutConstraint!
}

// MARK: - Life Cycle Methods
extension DipViewController {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.isNavigationBarHidden = true
    tabBarController?.tabBar.isHidden = false
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    setProgressBar(toPercentage: 70)
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    UIView.animate(withDuration: 1.0) { 
      self.navigationController?.isNavigationBarHidden = false
    }
  }
}

extension DipViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case dipDetails
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .dipDetails:
      break
    }
  }
}

// MARK: - Helper Methods
fileprivate extension DipViewController {
  func setProgressBar(toPercentage percent: CGFloat) {
    let max = progressView.frame.height
    
    let newValue = percent * max / 100
    progressBarConstraint.constant = max - newValue
    
    UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
}

// MARK: - @IBActions
private extension DipViewController {
  @IBAction func joinButtonTapped() {
    performSegue(withIdentifier: .dipDetails, sender: nil)
  }
}
