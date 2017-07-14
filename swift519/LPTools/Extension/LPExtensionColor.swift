//
//  LPExtensionColor.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/14.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        return UIColor(red: red, green: blue, blue: green, alpha: 1)
    }
    
    class func colorWithRGBHex(hex: UInt32) -> UIColor {
        let red = CGFloat((hex >> 16) & 0xFF)/CGFloat(255.0);
        let green = CGFloat((hex >> 8) & 0xFF)/CGFloat(255.0);
        let blue = CGFloat((hex) & 0xFF)/CGFloat(255.0);
        return UIColor(red: red, green: blue, blue: green, alpha: 1)
    }
    
    class func colorWithHexString(hex: NSString) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
