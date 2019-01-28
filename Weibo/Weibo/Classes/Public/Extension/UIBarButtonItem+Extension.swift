//
//  UIBarButtonItem+Extension.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/2/26.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imgName: String? = nil, title: String? = nil, target: Any?, action: Selector) {
        self.init()
        // 创建一个button
        let btn = UIButton()
        // 添加点击事件
        btn.addTarget(target, action: action, for: UIControl.Event.touchUpInside)
        // 设置image(带图片的按钮)
        if let img = imgName {
            btn.setImage(UIImage(named:img), for: UIControl.State.normal)
            btn.setImage(UIImage(named:"\(img)_highlighted"), for: UIControl.State.highlighted)
        }
        // 只有文字的按钮
        if let tit = title {
            btn.setTitle(tit, for: UIControl.State.normal)
            btn.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
            btn.setTitleColor(UIColor.orange, for: UIControl.State.highlighted)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            btn.setTitleColor(UIColor.blue, for: UIControl.State.disabled)
        }
        // 设置size
        btn.sizeToFit()
        customView = btn
    }
    
}
