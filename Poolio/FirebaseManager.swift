//
//  FirebaseManager.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Firebase

final class FirebaseManager {
  static let sharedInstance = FirebaseManager()
  
  init() {
    FIRApp.configure()
  }
}

extension FirebaseManager {
  func installPot() {
    
  }
}
