//
//  Gamble.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-23.
//  Copyright © 2016 Kelvin. All rights reserved.
//

final class Gamble {
  private(set) var name: String
  var pools: [Pool] = []
  let maximumTokens: Int
  
  init(name: String, maximumTokens: Int) {
    self.name = name
    self.maximumTokens = maximumTokens
  }
}

// MARK: - GamblePresentable
extension Gamble: GamblePresentable {
  var currentTokens: Int {
    return pools.reduce(0) { $0 + $1.tokens.count }
  }
}
