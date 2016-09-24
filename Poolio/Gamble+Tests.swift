//
//  Gamble+Tests.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

extension Gamble {
  static var localTestGambles: [Gamble] {
    let ferrariGamble = Gamble(name: "Ferrari Car", maximumTokens: 400)
    ferrariGamble.pools = Pool.samplePools1
    return [
      ferrariGamble,
      Gamble(name: "Versace Belt", maximumTokens: 300)
    ]
  }
  
  static var globalTestGambles: [Gamble] {
    return [
      Gamble(name: "Global Pot", maximumTokens: 200)
    ]
  }
}
