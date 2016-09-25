//
//  Gamble.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-23.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Foundation

final class Gamble {
  private(set) var name: String
  var pools: [Pool] = []
  let maximumTokens: Int
  let uniqueIdentifier: UUID
  
  init(name: String, maximumTokens: Int, uniqueIdentifier: UUID = UUID()) {
    self.name = name
    self.maximumTokens = maximumTokens
    self.uniqueIdentifier = uniqueIdentifier
  }
}

// MARK: - GamblePresentable
extension Gamble: GamblePresentable {
  var currentTokens: Int {
    return pools.reduce(0) { $0 + $1.tokens.count }
  }
}

// MARK: - JSONConvertible 
extension Gamble: JSONConvertible {
  var json: [String: Any] {
    return [
      "uniqueIdentifier": uniqueIdentifier.uuidString,
      "name": name,
      "pools": pools.map { $0.json },
      "maximumTokens": maximumTokens
    ]
  }
}
