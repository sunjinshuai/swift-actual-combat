//
//  WBTabBar.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/2/20.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class WBTabBar: UITabBar {
    
    var closure:(()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabBarComposeButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = WBSCREENWIDTH * 0.2
        var index: CGFloat = 0
    
        for view in subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                view.frame.size.width = width
                view.frame.origin.x = index * width
                index += 1
                if index == 2 {
                    index += 1
                }
            }
        }
        // 设置composeButton 的frame
        composeButton.center.x = frame.width * 0.5
        composeButton.center.y = frame.height * 0.5
    }
    
    // MARK: - 设置视图
    private func setupTabBarComposeButton(){
        // 添加控件
        addSubview(composeButton)
    }
    
    // MARK: - 监听事件
    @objc private func buttonClick(){
        closure?()
    }
    
    // MARK: - 懒加载控件
    // 加号按钮
    private lazy var composeButton: UIButton = {
        let btn = UIButton()
        // 点击事件
        btn.addTarget(self, action: #selector(buttonClick), for: UIControlEvents.touchUpInside)
        // 设置image
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        // 设置按钮大小
        btn.sizeToFit()
        return btn
    }()
}
