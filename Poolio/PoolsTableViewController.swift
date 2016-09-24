//
//  PoolsTableViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class PoolsTableViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!
  
  var gamble: Gamble!
}

// MARK: - UITableViewDataSource
extension PoolsTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gamble.pools.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if gamble.pools.isEmpty {
      return tableView.dequeueReusableCell(withIdentifier: "NoPoolsCell")!
    }
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PoolCell.reuseIdentifier) as? PoolCell else { fatalError() }
    cell.pool = gamble.pools[indexPath.row]
    return cell
  }
}
