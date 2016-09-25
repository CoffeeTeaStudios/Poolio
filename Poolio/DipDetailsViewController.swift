//
//  DipDetailsViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class DipDetailsViewController: UIViewController {
  @IBOutlet private var tableView: UITableView!
  
}

// MARK: - UITableViewDataSource
extension DipDetailsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PoolCell.reuseIdentifier) as? PoolCell else { fatalError() }
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
}

// MARK: - UITableViewDelegate
extension DipDetailsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    performSegue(withIdentifier: .poolDetail, sender: nil)
  }
}

// MARK: - Life Cycle Methods
extension DipDetailsViewController {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

// MARK: - SegueHandlerType
extension DipDetailsViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case contribute, poolDetail
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .contribute:
      break
    case .poolDetail:
      break
    }
  }
}

// MARK: - @IBActions
private extension DipDetailsViewController {
  @IBAction func dipButtonTapped() {
    performSegue(withIdentifier: .contribute, sender: nil)
  }
}
