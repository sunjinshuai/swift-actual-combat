//
//  WBTabBarController.swift
//  JSWeiboDemo
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

class WBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 实例化自定义tabBar
        let tabBar = WBTabBar()

        // 通过kvc 给只读属性赋值
        setValue(tabBar, forKey: "tabBar")
        // 首页
        addChildViewController(HomeViewController(), title: "首页", imgName: "tabbar_home")
        // 消息
        addChildViewController(MessageViewController(), title: "消息", imgName: "tabbar_message_center")
        // 发现
        addChildViewController(DiscoverViewController(), title: "发现", imgName: "tabbar_discover")
        // 我
        addChildViewController(ProfileViewController(), title: "我", imgName: "tabbar_profile")
    }
}

// MARK: - 添加子控制器的公共方法时
extension WBTabBarController {

    func addChildViewController(_ childController: UIViewController, title: String, imgName: String) {
        // 设置title
        childController.title = title
        // 设置title颜色
        childController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: WBTHEMECOLOR], for: UIControlState.selected)
        // 设置image
        // withRenderingMode 渲染方式
        // alwaysOriginal 采用图片原生颜色
        childController.tabBarItem.image = UIImage(named: imgName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: "\(imgName)_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        // 添加子控制器
        addChildViewController(UINavigationController(rootViewController: childController))
    }
}
