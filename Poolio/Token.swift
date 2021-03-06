//
//  Token.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-23.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Foundation

struct Token {
  let uniqueIdentifier: UUID
  let user: User
}

extension Token {
  init(user: User, uniqueIdentifier: UUID = UUID()) {
    self.user = user
    self.uniqueIdentifier = uniqueIdentifier
  }
}

extension Token: JSONConvertible {
  var json: [String: Any] {
    return [
      "uniqueIdentifier": uniqueIdentifier.uuidString,
      "userIdentifier": user.uniqueIdentifier.uuidString
    ]
  }
}
extension Token: Equatable {}

func ==(lhs: Token, rhs: Token) -> Bool {
  return lhs.user === rhs.user
}
