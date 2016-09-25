//
//  ContributeViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class ContributeViewController: UIViewController {
  @IBOutlet private var tokenTextField: UITextField! { didSet {
    tokenTextField.becomeFirstResponder()
  }}
}

// MARK: - @IBActions
private extension ContributeViewController {
  @IBAction func confirmButtonTapped() {
    _ = navigationController?.popToRootViewController(animated: true)
  }
  
  @IBAction func cancelButtonTapped() {
    _ = navigationController?.popViewController(animated: true)
  }
}
