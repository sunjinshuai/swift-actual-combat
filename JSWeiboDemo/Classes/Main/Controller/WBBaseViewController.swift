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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        loadData()
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
        
        view.backgroundColor = UIColor.white
        setupRefreshControl()
        loginState ? setupTableView() : setupVisitorView()
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
        view.insertSubview(visitorView!, belowSubview: (self.navigationController?.navigationBar)!)
    }
    
    /// 设置tableView
    private func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.insertSubview(tableView!, belowSubview: (self.navigationController?.navigationBar)!)
    }
}
