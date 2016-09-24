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
    let randomNumber = Int(arc4random_uniform(UInt32(100))) % 2
    if randomNumber == 0 {
      return Token(user: User.kelvin)
    } else if randomNumber == 1 {
      return Token(user: User.andy)
    } else {
      return Token(user: User.yili)
    }
  }
}
