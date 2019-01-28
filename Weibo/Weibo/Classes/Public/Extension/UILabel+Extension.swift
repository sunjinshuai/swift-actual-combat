//
//  UILabel+Extension.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/2/26.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(fontSize: CGFloat, textColor: UIColor, text: String? = nil) {
        self.init()
        // 字体大小
        self.font = UIFont.systemFont(ofSize: fontSize)
        // 字体颜色
        self.textColor = textColor
        // 设置text
        self.text = text
    }
}
