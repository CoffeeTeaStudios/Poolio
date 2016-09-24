//
//  Pool+Tests.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-24.
//  Copyright © 2016 Kelvin. All rights reserved.
//

extension Pool {
  static var samplePools1: [Pool] {
    let pool1 = Pool(name: "A", tokens: [], privacy: .open)
    pool1.tokens = (0...4).map { _ in Token.randomToken }
    let pool2 = Pool(name: "B", tokens: [], privacy: .closed)
    let pool3 = Pool(name: "C", tokens: [], privacy: .open)
    
    return [pool1, pool2, pool3]
  }
}
