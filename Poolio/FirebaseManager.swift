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
  fileprivate let gamblesRef: FIRDatabaseReference!
  fileprivate let tokensRef: FIRDatabaseReference!
  fileprivate let poolsRef: FIRDatabaseReference!
  fileprivate let usersRef: FIRDatabaseReference!
  
  init() {
    FIRApp.configure()
    storageRef = FIRDatabase.database().reference()
    gamblesRef = storageRef.child("gambles")
    tokensRef = storageRef.child("tokens")
    poolsRef = storageRef.child("pools")
    usersRef = storageRef.child("users")
  }
}

extension FirebaseManager {
  
  func installPot() {
    let gamble = Gamble(name: "Global Pot", maximumTokens: 100)
    
    let pools = Pool.samplePools1
    gamble.pools = pools
    
    let tokens: [Token] = pools.map { $0.tokens }.flatMap { $0 }
    
    gamblesRef.child(gamble.uniqueIdentifier.uuidString).setValue(gamble.json)
    
    pools.forEach {
      poolsRef.child($0.uniqueIdentifier.uuidString).setValue($0.json)
    }
    
    tokens.forEach {
      tokensRef.child($0.uniqueIdentifier.uuidString).setValue($0.json)
    }
    
    let users: [User] = tokens.map { $0.user }
    
    users.forEach {
      usersRef.child($0.uniqueIdentifier.uuidString).setValue($0.json)
    }
  }

}
