//
//  PoolCell.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol PoolDisplayable {
  var name: String { get }
  var memberCount: Int { get }
  var privacy: Pool.Privacy { get }
}

final class PoolCell: UITableViewCell {
  static let reuseIdentifier = "\(PoolCell.self)"
  
  @IBOutlet private var teamLabel: UILabel!
  @IBOutlet private var memberCountLabel: UILabel!
  
  @IBOutlet private var poolPrivacyLabel: UILabel!
  
  var pool: PoolDisplayable! { didSet {
    teamLabel.text = pool.name
    memberCountLabel.text = "\(pool.memberCount) members"
    poolPrivacyLabel.text = pool.privacy.rawValue
  }}
}
