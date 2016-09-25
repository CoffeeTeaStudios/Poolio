//
//  PoolCell.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

protocol PoolDisplayable {
  var name: String { get }
  var memberCount: Int { get }
}

final class PoolCell: UITableViewCell {
  static let reuseIdentifier = "\(PoolCell.self)"
  
  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var playerCountLabel: UILabel!
  @IBOutlet var poolImageView: UIImageView! { didSet {
    poolImageView.image = UIImage.imageWith(color: #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1))
  }}
  
  var pool: PoolDisplayable! { didSet {
    nameLabel.text = pool.name
    playerCountLabel.text = "\(pool.memberCount)/20 players"
  }}
}
