//
//  FirebaseManager.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Firebase

protocol JSONConvertible {
  var json: [String: Any] { get }
}

final class FirebaseManager {
  static let sharedInstance = FirebaseManager()
  fileprivate let storageRef: FIRDatabaseReference!
  
  init() {
    FIRApp.configure()
    storageRef = FIRDatabase.database().reference()
  }
}

extension FirebaseManager {
  func installPot() {
    let gamble = Gamble(name: "Global Pot", maximumTokens: 100)
    
    let pools = Pool.samplePools1
    gamble.pools = pools
    
    let tokens: [Token] = pools.map { $0.tokens }.flatMap { $0 }
    
    storageRef.child("gambles").child(gamble.uniqueIdentifier.uuidString).setValue(gamble.json)
    
    pools.forEach {
      storageRef.child("pools").child($0.uniqueIdentifier.uuidString).setValue($0.json)
    }
    
    tokens.forEach {
      storageRef.child("tokens").child($0.uniqueIdentifier.uuidString).setValue($0.json)
    }
    
    let users: [User] = tokens.map { $0.user }
    
    users.forEach {
      storageRef.child("users").child($0.uniqueIdentifier.uuidString).setValue($0.json)
    }
  }
}
