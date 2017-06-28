//
//  GradientLayer.swift
//  FarmingManager
//
//  Created by Alexandre Montoya on 28/06/2017.
//  Copyright © 2017 Alexandre Montoya. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.1, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
    
    }
    
    
}

//UIColor.rgb(red: 153, green: 26, blue: 97)
//UIColor.rgb(red: 80, green: 167, blue: 194)
