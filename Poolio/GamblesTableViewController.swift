//
//  GamblesTableViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit


final class GamblesTableViewController: UIViewController {
  fileprivate enum Section: Int {
    case localGambles
    case globalGambles
    
    static var allValues: [Section] {
      return [.localGambles, .globalGambles]
    }
  }
  
  @IBOutlet private var tableView: UITableView!
  fileprivate var localGambles: [Gamble] = []
  fileprivate var globalGambles: [Gamble] = []
}

// MARK: - UITableViewDataSource
extension GamblesTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = Section(rawValue: indexPath.section) else { fatalError() }
    switch section {
    case .localGambles:
      if localGambles.isEmpty {
        return tableView.dequeueReusableCell(withIdentifier: "NoGamblesCell")!
      }
    case .globalGambles:
      if globalGambles.isEmpty {
        return tableView.dequeueReusableCell(withIdentifier: "NoGamblesCell")!
      }
    }
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: GambleCell.reuseIdentifier) as? GambleCell else { fatalError() }
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = Section(rawValue: section) else { fatalError() }
    switch section {
    case .localGambles:
      if localGambles.isEmpty {
        return 1
      }
      return localGambles.count
    case .globalGambles:
      if globalGambles.isEmpty {
        return 1
      }
      return globalGambles.count
    }
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    guard let section = Section(rawValue: section) else { fatalError() }
    switch section {
    case .localGambles:
      return "Nearby"
    case .globalGambles:
      return "Global"
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return Section.allValues.count
  }
}
