//
//  UIColor+Extension.swift
//  JSWeiboDemo
//
//  Created by Michael on 2017/3/13.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

extension UIColor {
    
    open class func defaultNavBarTintColor() -> UIColor {
        return UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
    }
    
    /**
     *  16进制 转 RGB
     */
    class func rgbColorFromHex(rgb:Int) -> UIColor {
        
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
                       alpha: 1.0)
    }
}
