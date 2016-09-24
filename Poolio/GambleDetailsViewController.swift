//
//  GambleDetailsViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class GambleDetailsViewController: UIViewController {
  var gamble: Gamble!
}

// MARK: - SegueHandlerType
extension GambleDetailsViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case pools
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierForSegue(segue: segue) {
    case .pools:
      guard let poolsVC = segue.destination as? PoolsTableViewController else { fatalError() }
      poolsVC.gamble = gamble
    }
  }
}
