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
        print("左侧按钮点击")
    }
    // 右侧按钮点击
    @objc fileprivate func setting(){
        print("右侧按钮点击")
        
    }
}
