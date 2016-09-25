//
//  DipViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class DipViewController: UIViewController {
  
}

// MARK: - Life Cycle Methods
extension DipViewController {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.navigationController?.isNavigationBarHidden = true
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

// MARK: - @IBActions
private extension DipViewController {
  @IBAction func joinButtonTapped() {
    performSegue(withIdentifier: .dipDetails, sender: nil)
  }
}
