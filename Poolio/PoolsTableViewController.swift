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
    if gamble.pools.isEmpty {
      return 1
    }
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

// MARK: - UITableViewDelegate
extension PoolsTableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
