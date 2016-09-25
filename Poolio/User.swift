//
//  User.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-23.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

final class User {
  var uniqueIdentifier: UUID
  var firstName: String
  var lastName: String
  
  var tokens: [Token] = []
  
  init(firstName: String, lastName: String, uniqueIdentifier: UUID = UUID()) {
    self.firstName = firstName
    self.lastName = lastName
    self.uniqueIdentifier = uniqueIdentifier
  }
}


// MARK: - JSONConvertible
extension User: JSONConvertible {
  var json: [String: Any] {
    return [
      "uniqueIdentifier": uniqueIdentifier.uuidString,
      "firstName": firstName,
      "lastName": lastName,
      "tokens": tokens.map { $0.uniqueIdentifier.uuidString }
    ]
  }
}
