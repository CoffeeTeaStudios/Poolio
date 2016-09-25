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
  enum FirebaseRoot {
    case gamble(Gamble)
    case tokens([Token])
    case pools([Pool])
    case users([User])
  }
  
  enum FirebaseObject {
    case gamble
    case token
    case pool
    case user
  }
  
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
  
  func observeRoot(forObject object: FirebaseObject, updates: @escaping (FirebaseRoot) -> ()) {
    storageRef.observe(.value, with: { snapshot in
      guard let rootDict = snapshot.value as? [String: Any] else { fatalError() }
    
      guard let gamblesDict = rootDict["gambles"] as? [String: Any] else { fatalError() }
      guard let poolsDict = rootDict["pools"] as? [String: Any] else { fatalError() }
      guard let tokensDict = rootDict["tokens"] as? [String: Any] else { fatalError() }
      guard let usersDict = rootDict["users"] as? [String: Any] else { fatalError() }
      
      switch object {
      case .gamble:

        guard let gambleDict = gamblesDict.first?.1 as? [String: Any] else { fatalError() }
        
        guard let name = gambleDict["name"] as? String else { fatalError() }
        guard let maximumTokens = gambleDict["maximumTokens"] as? Int else { fatalError() }
        guard let uniqueIdentifier = gambleDict["uniqueIdentifier"] as? String else { fatalError() }
        guard let pools = gambleDict["pools"] as? [String] else { fatalError() }
        
        let gamble = Gamble(name: name, maximumTokens: maximumTokens, uniqueIdentifier: UUID(uuidString:uniqueIdentifier)!)
        gamble.pools = pools.map { id -> Pool in
          guard let poolDict = poolsDict[id] as? [String: Any] else { fatalError() }
          guard let name = poolDict["name"] as? String else { fatalError() }
          guard let privacy = poolDict["privacy"] as? String else { fatalError() }
          guard let tokens = poolDict["tokens"] as? [String] else { fatalError() }
          guard let uniqueIdentifier = poolDict["uniqueIdentifier"] as? String else { fatalError() }
          
          let pool = Pool(name: name, tokens: [], privacy: Pool.Privacy(rawValue: privacy)!, uniqueIdentifier: UUID(uuidString: uniqueIdentifier)!)
          pool.tokens = tokens.map { id -> Token in
            guard let tokenDict = tokensDict[id] as? [String: Any] else { fatalError() }
            
            guard let uniqueIdentifier = tokenDict["uniqueIdentifier"] as? String else { fatalError() }
            guard let userID = tokenDict["userIdentifier"] as? String else { fatalError() }
            
            guard let userDict = usersDict[userID] as? [String: Any] else { fatalError() }
            guard let firstName = userDict["firstName"] as? String else { fatalError() }
            guard let lastName = userDict["lastName"] as? String else { fatalError() }
            guard let userUniqueIdentifier = userDict["uniqueIdentifier"] as? String else { fatalError() }
            
            let user = User(firstName: firstName, lastName: lastName, uniqueIdentifier: UUID(uuidString: userUniqueIdentifier)!)
            let token = Token(uniqueIdentifier: UUID(uuidString: uniqueIdentifier)!, user: user)
            return token
          }
          return pool
        }
        updates(.gamble(gamble))
      default:
        fatalError()
      }
    })
  }
}
