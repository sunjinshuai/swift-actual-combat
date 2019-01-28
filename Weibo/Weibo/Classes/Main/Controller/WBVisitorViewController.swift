//
//  WBVisitorViewController.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/2/26.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class WBVisitorViewController: UIViewController {

    var visitorView:WBVisitorView?
    // 列表
    lazy var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 未登录
        setupVisitorView()
    }

    // 实例化visitorView
    private func setupVisitorView(){
        // 未登录的状态创建导航按钮
        setupNav()
        visitorView = WBVisitorView()

        view = visitorView
    }
    
    // 设置导航
    private func setupNav(){
        // 左侧
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: nil, title: "登录", target: self, action: #selector(loginClick))
        
        // 右侧
        navigationItem.rightBarButtonItem = UIBarButtonItem(imgName: nil, title: "注册", target: self, action: #selector(loginClick))
    }

    // 微博登录与注册弹出控制器
    @objc private func loginClick(){
        print("登录按钮点击")
    }
}
