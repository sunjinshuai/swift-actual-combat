//
//  WBNavigationController.swift
//  SwiftActualCombat
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
    }
    // 将要接受手势点击
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return children.count != 1
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            // 隐藏
            viewController.hidesBottomBarWhenPushed = true
            
            var title = "返回"
            if children.count == 1 {
                title = children.first?.title ?? "返回"
            }
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "navigationbar_back_withtext", title: title, target: self, action: #selector(popToParent))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return visibleViewController?.preferredStatusBarStyle ?? .default
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
