//
//  WBBaseViewController.swift
//  JSWeiboDemo
//
//  Created by Michael on 2017/2/26.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    var visitorView: VisitorView?
    var loginState = false
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?
    var isPullup = false
    
    // 登录按钮
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 200, y: 200, width: 100, height: 50)
        // 点击事件
        btn.addTarget(self, action: #selector(loginButtonClick), for: UIControlEvents.touchUpInside)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"common_button_white"), for: UIControlState.normal)
        // 设置文字
        btn.setTitle("登录", for: UIControlState.normal)
        // 设置文字颜色
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.setTitleColor(UIColor.orange, for: UIControlState.highlighted)
        // 设置字体大小
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        return btn
    }()
    
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    lazy var navItem = UINavigationItem()
    
    // MARK: - 监听事件
    @objc private func loginButtonClick(){
        
        let test = UIViewController()
        test.view.backgroundColor = UIColor.red
        test.navBarBgAlpha = 0
        test.navBarTintColor = .white
        self.navigationController?.pushViewController(test, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        loadData()
        
        self.view.addSubview(loginButton)
        
    }
    
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    func loadData() {
        refreshControl?.endRefreshing()
    }
}

/// MARK: UITableViewDataSource、UITableViewDelegate
extension WBBaseViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) && !isPullup {
            
            isPullup = true
            loadData()
        }
    }
}

/// 设置UI
extension WBBaseViewController {
    
    func setupUI() {
        
        view.backgroundColor = UIColor.yellow
//        setupNavigationBar()
//        setupRefreshControl()
//        loginState ? setupTableView() : setupVisitorView()
    }
    
    /// 添加下拉刷新控件
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        tableView?.addSubview(refreshControl!)
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    /// 设置访客视图
    private func setupVisitorView() {
        
        visitorView = VisitorView()
        visitorView?.frame = view.bounds
        view.insertSubview(visitorView!, belowSubview: navigationBar)
    }
    
    /// 设置tableView
    private func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.insertSubview(tableView!, belowSubview: navigationBar)
    }
    
    /// 设置导航条
    private func setupNavigationBar() {
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        // 设置导航条渲染的颜色
        navigationBar.barTintColor = RGB(r: 249, g: 249, b: 249)
        // 设置导航条字体的颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
}
