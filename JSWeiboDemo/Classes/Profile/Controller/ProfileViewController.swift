//
//  ProfileViewController.swift
//  JSWeiboDemo
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    fileprivate var tableView: UITableView?
    
    fileprivate var listArr = [[""],["新的好友","微博等级"],["我的相册","我的点评","我的赞"],["微博支付","微博运动"],["粉丝头条","粉丝服务"],["草稿箱"],["更多"]]
    fileprivate var listExplainArr = [[""],["","连续登陆30天"],["","",""],["十元夺保时捷718","每天10000步，你达标了吗？"],["推广博文及账号的利器","橱窗，私信，营销"],[""],["文章，收藏"]]
    
    fileprivate var listImageArr = [[""],["message_addfansgroup","message_addfansgroup"],["message_choosegroup","message_choosegroup","message_choosegroup"],["message_creatchat","message_creatchat"],["message_icon_group","message_icon_group"],["messagescenter_comments"],["messagescenter_groupchat_notice"]]

    func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return nil
        } else {
            return nil
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
        view.insertSubview(tableView!, belowSubview: (self.navigationController?.navigationBar)!)
    }
}


