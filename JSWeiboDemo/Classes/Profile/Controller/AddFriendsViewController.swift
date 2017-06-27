//
//  AddFriendsViewController.swift
//  JSWeiboDemo
//
//  Created by michael on 2017/6/27.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

private let identifier1 = "AddFriendsStyle1ViewCell"
private let identifier2 = "AddFriendsStyle2ViewCell"

class AddFriendsViewController: UIViewController {
    
    fileprivate var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "添加好友"
        self.view.backgroundColor = UIColor.white
        
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

/// MARK: UITableViewDataSource、UITableViewDelegate
extension AddFriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier1, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier2, for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else {
            return 80
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

/// MARK: - 设置界面
extension AddFriendsViewController {
    
    /// 设置tableView
    func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView?.register(AddFriendsStyle1ViewCell.self, forCellReuseIdentifier: identifier1)
        tableView?.register(AddFriendsStyle2TableViewCell.self, forCellReuseIdentifier: identifier2)
        view.insertSubview(tableView!, belowSubview: (self.navigationController?.navigationBar)!)
    }
}
