//
//  DiscoverViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class DiscoverViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!
}

// MARK: - UITableViewDataSource
extension DiscoverViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    <#code#>
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverCell.reuseIdentifier) as? DiscoverCell else { fatalError() }
    
    return cell
  }
}

