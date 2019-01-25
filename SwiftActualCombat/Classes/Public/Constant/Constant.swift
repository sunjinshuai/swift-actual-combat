//
//  Constant.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/2/20.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

// 屏幕的宽度和高度
let WBSCREENWIDTH = UIScreen.main.bounds.width
let WBSCREENHEIGHT = UIScreen.main.bounds.height

// 微博的主题颜色
let WBTHEMECOLOR = UIColor.orange

// RGB颜色
func RGB(r:Float, g: Float, b: Float, alpha: Float = 1) -> UIColor {
    return UIColor(colorLiteralRed: r/Float(255), green: g/Float(255), blue: b/Float(255), alpha: alpha)
}
