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

        setupNavigationItem()
        setupTableView()
    }
    
    override func loadData() {
        for i in 0 ..< 10 {
            falseDatas.insert(i.description, at: 0)
        }
    }
    
    //MARK: - 设置导航
    private func setupNavigationItem() {
        // 左侧
        navItem.leftBarButtonItem = UIBarButtonItem(imgName: "navigationbar_friendsearch", target: self, action: #selector(leftClick))
        // 右侧
        navItem.rightBarButtonItem = UIBarButtonItem(imgName: "navigationbar_pop", target: self, action: #selector(rightClick))
    }
    
    private func setupTableView() {
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }
}

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

//MARK: - 监听事件
extension HomeViewController {
    /*
     private 私有的在自己类内部使用没有问题 但是 如果吧方法放到其类的extension 就会找不到该方法 需要使用fileprivate 来修饰
     */
    // 左侧按钮点击
    @objc fileprivate func leftClick(){
        print("左侧按钮点击")
        
        let temp = WBTempViewController()
        self.navigationController?.pushViewController(temp, animated: true)
    }
    // 右侧按钮点击
    @objc fileprivate func rightClick(){
        print("右侧按钮点击")
        let temp = WBTempViewController()
        self.navigationController?.pushViewController(temp, animated: true)
    }
}
