//
//  UIImage+Color.swift
//  Poolio
//
//  Created by Kelvin Lau on 2016-09-25.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIImage {
  class func imageWith(color: UIColor) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 20)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()!
    
    context.setFillColor(color.cgColor)
    context.fill(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
  }
}
