//
//  UIColor+Extension.swift
//  CustomAlertDemo
//
//  Created by Taslim Ansari on 29/10/18.
//  Copyright © 2018 Finoit. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    static func colorWithParameters(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    
    static var seperatorColor: UIColor {
        return colorWithParameters(r: 200, g: 200, b: 200)
    }
    
    static var defaultBGColor: UIColor {
        return colorWithParameters(r: 250, g: 250, b: 250)
    }
    
    static var actionButtonTitleDefaultColor: UIColor {
        return colorWithParameters(r: 76, g: 138, b: 247)
    }
    
}
