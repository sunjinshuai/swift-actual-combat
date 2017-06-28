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
    fileprivate var listArray: Array<Any> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        setupTableView()
        loadNetWorkRequest()
    }
    
    private func setupNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imgName: nil, title: "添加好友", target: self, action: #selector(addFriend))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imgName: nil, title: "设置", target: self, action: #selector(setting))
    }
}

/// MARK: UITableViewDataSource、UITableViewDelegate
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return (listArray[section - 1] as! Array<Any>).count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headViewIdentifier, for: indexPath) as! ProfileHeadViewCell
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ProfileViewCell
            let group = listArray[indexPath.section - 1] as! Array<Any>
            cell.profileModel = group[indexPath.row] as? ProfileModel
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        } else {
            return 50
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

/// MARK: ProfileHeadViewCellDelegate
extension ProfileViewController: ProfileHeadViewCellDelegate {
    
    func profileHeadViewTouchToPersonCenter() {
        let personCenter = PersonCenterViewController()
        self.navigationController?.pushViewController(personCenter, animated: true)
    }
}

/// MARK: - 监听事件
extension ProfileViewController {
    
    @objc fileprivate func addFriend(){
        let addFriends = AddFriendsViewController()
        self.navigationController?.pushViewController(addFriends, animated: true)
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

/// MARK: - 设置数据
extension ProfileViewController {
    
    /// 设置tableView
    func loadNetWorkRequest() {
        
        var group1 = Array<Any>()
        
        let model1 = ProfileModel()
        model1.profile_titleName = "签到有礼"
        model1.profile_image = "message_motion"
        model1.profile_subTitleName = "每日签到，红包多多"
        
        let model2 = ProfileModel()
        model2.profile_titleName = "新的好友"
        model2.profile_image = "message_addfansgroup"
        model2.profile_subTitleName = ""
        
        group1.append(model1)
        group1.append(model2)
        
        var group2 = Array<Any>()
        
        let model3 = ProfileModel()
        model3.profile_titleName = "我的相册"
        model3.profile_image = "message_album"
        model3.profile_subTitleName = ""
        
        let model4 = ProfileModel()
        model4.profile_titleName = "我的赞"
        model4.profile_image = "message_fabulous"
        model4.profile_subTitleName = "收藏，移到这里了"
        
        group2.append(model3)
        group2.append(model4)
        
        var group3 = Array<Any>()
        
        let model5 = ProfileModel()
        model5.profile_titleName = "微博钱包"
        model5.profile_image = "message_wallet"
        model5.profile_subTitleName = "送钱！火力全开"
        
        let model6 = ProfileModel()
        model6.profile_titleName = "微博运动"
        model6.profile_image = "message_motion"
        model6.profile_subTitleName = "全民热舞抢红包"
        
        let model7 = ProfileModel()
        model7.profile_titleName = "免流量"
        model7.profile_image = "message_flow"
        model7.profile_subTitleName = "刷微博、看视频"
        
        group3.append(model5)
        group3.append(model6)
        group3.append(model7)
        
        var group4 = Array<Any>()
        
        let model8 = ProfileModel()
        model8.profile_titleName = "粉丝服务"
        model8.profile_image = "message_fans"
        model8.profile_subTitleName = "写文章、发点评、赚粉丝"
        
        let model9 = ProfileModel()
        model9.profile_titleName = "粉丝头条"
        model9.profile_image = "message_the_headlines"
        model9.profile_subTitleName = "推广博文及账号的利器"
        
        group4.append(model8)
        group4.append(model9)
        
        var group5 = Array<Any>()
        
        let model10 = ProfileModel()
        model10.profile_titleName = "客服中心"
        model10.profile_image = "message_customer_service"
        model10.profile_subTitleName = ""
        
        group5.append(model10)
        
        var group6 = Array<Any>()
        
        let model11 = ProfileModel()
        model11.profile_titleName = "草稿箱"
        model11.profile_image = "message_drafts"
        model11.profile_subTitleName = ""
        
        group6.append(model11)
        
        listArray.append(group1)
        listArray.append(group2)
        listArray.append(group3)
        listArray.append(group4)
        listArray.append(group5)
        listArray.append(group6)
    }
}




