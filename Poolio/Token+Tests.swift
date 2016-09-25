//
//  Token+Tests.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import Foundation

extension Token {
  static var randomToken: Token {
    let randomNumber = Int(arc4random_uniform(UInt32(100))) % 3
    if randomNumber == 0 {
      let token = Token(user: User.kelvin)
      User.kelvin.tokens.append(token)
      return token
    } else if randomNumber == 1 {
      let token = Token(user: User.andy)
      User.andy.tokens.append(token)
      return token
    } else {
      let token = Token(user: User.yili)
      User.yili.tokens.append(token)
      return token
    }
  }
}
