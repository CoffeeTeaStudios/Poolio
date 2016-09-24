//
//  Gamble+Tests.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

extension Gamble {
  static var localTestGambles: [Gamble] {
    return [
      Gamble(name: "Ferrari Car"),
      Gamble(name: "Versace Belt")
    ]
  }
  
  static var globalTestGambles: [Gamble] {
    return [
      Gamble(name: "Global Pot")
    ]
  }
}
