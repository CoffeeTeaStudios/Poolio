//
//  Token.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-23.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Foundation

struct Token {
  let user: User
}

extension Token: Equatable {}

func ==(lhs: Token, rhs: Token) -> Bool {
  return lhs.user === rhs.user
}
