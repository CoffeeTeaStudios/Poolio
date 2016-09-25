//
//  DipViewController.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class DipViewController: UIViewController {
  @IBOutlet fileprivate var progressView: UIView!
  @IBOutlet fileprivate var progressBarConstraint: NSLayoutConstraint!
  @IBOutlet fileprivate var payoutLabel: UILabel!
  @IBOutlet fileprivate var nextRoundLabel: UILabel!
  @IBOutlet fileprivate var maximumTokensLabel: UILabel!
  @IBOutlet fileprivate var currentTokensLabel: UILabel!
  
  @IBOutlet fileprivate var entryLabel: UILabel!
  
  fileprivate let firebaseManager = FirebaseManager.sharedInstance
  
  fileprivate var gamble: Gamble! { didSet {
    updateUI()
  }}
  
  func updateUI() {
    print("updating UI")
    maximumTokensLabel.text = "D \(gamble.maximumTokens + 100)"
    
    var tokens = 0
    for pool in gamble.pools {
      tokens += pool.tokens.count
    }
    currentTokensLabel.text = "D \(tokens)"
    
    setProgressBar(toPercentage: 100 * CGFloat(tokens) / CGFloat(gamble.maximumTokens))
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }

}

// MARK: - Life Cycle Methods
extension DipViewController {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    firebaseManager.installPot()
    
    firebaseManager.observeRoot(forObject: .gamble) { updates in
      guard case let .gamble(gamble) = updates else { fatalError() }
      self.gamble = gamble
    }
    
    NotificationCenter.default.addObserver(self, selector: #selector(DipViewController.received), name: NSNotification.Name(rawValue: "contribution"), object: nil)
  }

  func received() {
    setProgressBar(toPercentage: 50)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.isNavigationBarHidden = true
    tabBarController?.tabBar.isHidden = false
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    UIView.animate(withDuration: 1.0) { 
      self.navigationController?.isNavigationBarHidden = false
    }
  }
}

extension DipViewController: SegueHandlerType {
  enum SegueIdentifier: String {
    case dipDetails
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segueIdentifierFor(segue: segue) {
    case .dipDetails:
      break
    }
  }
}

// MARK: - Helper Methods
fileprivate extension DipViewController {
  func setProgressBar(toPercentage percent: CGFloat) {
    let max = progressView.frame.height
    
    let newValue = percent * max / 100
    progressBarConstraint.constant = max - newValue
    
    UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
}

// MARK: - @IBActions
private extension DipViewController {
  @IBAction func joinButtonTapped() {
    performSegue(withIdentifier: .dipDetails, sender: nil)
  }
}
