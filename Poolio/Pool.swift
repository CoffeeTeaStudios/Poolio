//
//  Pool.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-23.
//  Copyright © 2016 Kelvin. All rights reserved.
//

final class Pool {
  enum Privacy: String {
    case open = "Open", closed = "Closed"
  }
  
  private(set) var name: String
  private(set) var tokens: [Token]
  private(set) var privacy: Privacy
  
  init(name: String, tokens: [Token], privacy: Privacy) {
    self.name = name
    self.tokens = tokens
    self.privacy = privacy
  }
}

// MARK: - PoolDisplayable
extension Pool: PoolDisplayable {
  var memberCount: Int {
    return 5
  }
}
