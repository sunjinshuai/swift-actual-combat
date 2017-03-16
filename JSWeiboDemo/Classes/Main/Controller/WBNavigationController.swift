//
//  WBNavigationController.swift
//  JSWeiboDemo
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 当自定义导航左侧按钮后 点击屏幕左侧不能返回的bug 解决方法
        interactivePopGestureRecognizer?.delegate = self
        //设置 navBar 的渲染颜色
        navigationBar.barTintColor = UIColor.rgbColorFromHex(rgb: 0xF6F6F6)
        //设置navBar 的标题字体颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
        //设置系统按钮的文字渲染颜色  只对系统.plain 的方法有效
        navigationBar.tintColor = UIColor.orange
    }
    // 将要接受手势点击
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return childViewControllers.count != 1
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            // 隐藏
            viewController.hidesBottomBarWhenPushed = true
            
            var title = "返回"
            if childViewControllers.count == 1 {
                title = childViewControllers.first?.title ?? "返回"
            }
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "navigationbar_back_withtext", title: title, target: self, action: #selector(popToParent))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    // MARK: - 监听事件
    @objc private func leftClick(){
        _ = popViewController(animated: true)
    }
    
    // MARK: - 监听事件，返回上一级
    @objc private func popToParent(){
        _ = popViewController(animated: true)
    }
}
