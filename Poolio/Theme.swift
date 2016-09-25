//
//  Theme.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit

struct Theme {
  static let color = #colorLiteral(red: 0.3697856069, green: 0.4057266116, blue: 0.4758942723, alpha: 1)
  
  static func applyGlobalTint() {
    UIApplication.shared.delegate?.window??.tintColor = .white
  }
  
  static func changeNaviBarColor() {
    UINavigationBar.appearance().setBackgroundImage(UIImage.imageWith(color: Theme.color), for: .default)
    UINavigationBar.appearance().clipsToBounds = true
  }
  
  static func changeTabBarColor() {
    UITabBar.appearance().backgroundImage = UIImage.imageWith(color: Theme.color)
    UITabBar.appearance().clipsToBounds = true
  }
  
  static func changeNaviBarTextColor() {
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
  }
}
