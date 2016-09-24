//
//  DiscoverCell.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class DiscoverCell: UITableViewCell {
  static let reuseIdentifier = "\(DiscoverCell.self)"
  
  @IBOutlet private var teamLabel: UILabel!
  @IBOutlet private var memberCountLabel: UILabel!
  
  @IBOutlet private var poolPrivacyLabel: UILabel!
}
