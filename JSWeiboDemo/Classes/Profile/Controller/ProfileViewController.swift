//
//  ProfileViewController.swift
//  JSWeiboDemo
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

private let identifier = "ProfileViewCell"
private let headViewIdentifier = "ProfileHeadViewCell"

class ProfileViewController: UIViewController {
    
    fileprivate var tableView: UITableView?
    
    fileprivate var listArr = [[""],["签到有礼","新的好友"],["我的相册","我的赞"],["微博钱包","微博运动","免流量"],["粉丝服务","粉丝头条"],["客服中心"],["草稿箱"]]
    fileprivate var listExplainArr = [[""],["每日签到，红包多多",""],["","收藏，移到这里了"],["送钱！火力全开","全民热舞抢红包","刷微博、看视频"],["写文章、发点评、赚粉丝","推广博文及账号的利器"],[""],[""]]
    
    fileprivate var listImageArr = [[""],["message_drafts","message_addfansgroup"],["message_album","message_fabulous"],["message_wallet","message_motion","message_flow"],["message_fans","message_the_headlines"],["message_customer_service"],["message_drafts"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupTableView()
    }
    
    private func setupNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: nil, title: "添加好友", target: self, action: #selector(addFriend))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imgName: nil, title: "设置", target: self, action: #selector(setting))
    }
}

/// MARK: UITableViewDataSource、UITableViewDelegate
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headViewIdentifier, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 6 {
            return 10
        } else {
            return 0.01
        }
    }
}

/// MARK: - 监听事件
extension ProfileViewController {
    
    @objc fileprivate func addFriend(){
        let personCenter = PersonCenterViewController()
        self.navigationController?.pushViewController(personCenter, animated: true)
        
    }
    
    @objc fileprivate func setting(){
        let setting = SettingViewController()
        self.navigationController?.pushViewController(setting, animated: true)
    }
}

/// MARK: - 设置界面
extension ProfileViewController {
    
    /// 设置tableView
    func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView?.register(ProfileHeadViewCell.self, forCellReuseIdentifier: headViewIdentifier)
        tableView?.register(ProfileViewCell.self, forCellReuseIdentifier: identifier)
        view.insertSubview(tableView!, belowSubview: (self.navigationController?.navigationBar)!)
    }
}


