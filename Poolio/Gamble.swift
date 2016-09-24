//
//  Gamble.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-23.
//  Copyright © 2016 Kelvin. All rights reserved.
//

final class Gamble {
  private(set) var name: String
  private(set) var pools: [Pool] = []
  
  init(name: String) {
    self.name = name
  }
}
