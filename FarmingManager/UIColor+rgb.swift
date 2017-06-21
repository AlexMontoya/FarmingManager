//
//  UIColor+rgb.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 21/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)}
}
