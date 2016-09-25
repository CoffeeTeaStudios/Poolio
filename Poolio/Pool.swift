//
//  Pool.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-23.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Foundation

final class Pool {
  enum Privacy: String {
    case open = "Open", `private` = "Private"
  }
  
  private(set) var name: String
  var tokens: [Token]
  private(set) var privacy: Privacy
  let uniqueIdentifier: UUID
  
  init(name: String, tokens: [Token], privacy: Privacy, uniqueIdentifier: UUID = UUID()) {
    self.name = name
    self.tokens = tokens
    self.privacy = privacy
    self.uniqueIdentifier = uniqueIdentifier
  }
}

// MARK: - PoolDisplayable
extension Pool: PoolDisplayable {
  var memberCount: Int {
    var uniqueTokens: [Token] = []
    for token in tokens {
      if !uniqueTokens.contains(token) {
        uniqueTokens.append(token)
      }
    }
    
    return uniqueTokens.count
  }
}

// MARK: - JSONConvertible
extension Pool: JSONConvertible {
  var json: [String: Any] {
    return [
      "name": name,
      "tokens": tokens.map { $0.json },
      "privacy": privacy.rawValue,
      "uniqueIdentifier": uniqueIdentifier.uuidString
    ]
  }
}
