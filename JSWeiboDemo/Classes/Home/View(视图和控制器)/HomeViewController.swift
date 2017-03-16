//
//  HomeViewController.swift
//  JSWeiboDemo
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

private let identifier = "UITableViewCell"

class HomeViewController: WBBaseViewController {

    fileprivate lazy var falseDatas = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        visitorView?.setupVisiorViewInfo(imgName: nil, title: "关注一些人，回这里看看有什么惊喜")
    }
}

// MARK: - UITableViewDataSource、UITableViewDelegate
extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return falseDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "测试数据" + falseDatas[indexPath.row]
        return cell
    }
}

// MARK: - 加载数据
extension HomeViewController {
    
    override func loadData() {
        super.loadData()
        // 模拟加载数据
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            for i in 0 ..< 10 {
                if self.isPullup {
                    self.falseDatas.append("上拉刷新\(i)")
                } else {
                    self.falseDatas.insert("下拉刷新\(i.description)", at: 0)
                }
            }
            self.refreshControl?.endRefreshing()
            self.isPullup = false
            self.tableView?.reloadData()
        }
    }
}

//MARK: - 监听事件
extension HomeViewController {
    
    @objc fileprivate func leftClick(){
        print("左侧按钮点击")
        
        let temp = WBTempViewController()
        self.navigationController?.pushViewController(temp, animated: true)
    }
    
    @objc fileprivate func rightClick(){
        print("右侧按钮点击")
        let temp = WBTempViewController()
        self.navigationController?.pushViewController(temp, animated: true)
    }
}

//MARK: - 设置界面
extension HomeViewController {
    
    override func setupTableView() {
        super.setupTableView()
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView?.contentInset = UIEdgeInsets(top: (self.navigationController?.navigationBar.bounds.height)!,
                                               left: 0,
                                               bottom: tabBarController?.tabBar.bounds.height ?? 49,
                                               right: 0)

        setupNavigationItem()
    }
    
    
    //MARK: - 设置导航
    private func setupNavigationItem() {
        // 左侧
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: "navigationbar_friendsearch", target: self, action: #selector(leftClick))
        // 右侧
        navigationItem.rightBarButtonItem = UIBarButtonItem(imgName: "navigationbar_pop", target: self, action: #selector(rightClick))
    }
    
}
