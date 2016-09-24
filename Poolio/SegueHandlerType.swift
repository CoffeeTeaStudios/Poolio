//
//  SegueHandlerType.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol SegueHandlerType {
  associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
  func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {
    performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
  }
  
  func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {
    guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else { fatalError("Invalid identifier supplied") }
    return segueIdentifier
  }
}
