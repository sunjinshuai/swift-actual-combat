//
//  ProfileViewController.swift
//  JSWeiboDemo
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

class ProfileViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        
//        visitorView?.setupVisiorViewInfo(imgName: "visitordiscover_image_profile", title: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
    }
    
    //MARK: - 设置导航
    private func setupNavigationItem() {
        // 左侧
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: nil, title: "添加好友", target: self, action: #selector(addFriend))
        
        // 右侧
        navigationItem.rightBarButtonItem = UIBarButtonItem(imgName: nil, title: "设置", target: self, action: #selector(setting))
    }
}

//MARK: - 监听事件
extension ProfileViewController {
    /*
     private 私有的在自己类内部使用没有问题 但是 如果吧方法放到其类的extension 就会找不到该方法 需要使用fileprivate 来修饰
     */
    // 左侧按钮点击
    @objc fileprivate func addFriend(){
        
        let personCenter = PersonCenterViewController()
        self.navigationController?.pushViewController(personCenter, animated: true)
        
    }
    // 右侧按钮点击
    @objc fileprivate func setting(){
        
        let setting = SettingViewController()
        self.navigationController?.pushViewController(setting, animated: true)
    }
}
