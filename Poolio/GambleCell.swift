//
//  GambleCell.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol GamblePresentable {
  var name: String { get }
  var currentTokens: Int { get }
  var maximumTokens: Int { get }
}

final class GambleCell: UITableViewCell {
  static let reuseIdentifier = "\(GambleCell.self)"

  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var currentTokensLabel: UILabel!
  @IBOutlet private var maximumTokensLabel: UILabel!
  
  var gamble: GamblePresentable! { didSet {
    nameLabel.text = gamble.name
    currentTokensLabel.text = "\(gamble.currentTokens)"
    maximumTokensLabel.text = "\(gamble.maximumTokens)"
  }}
}
