//
//  SettingViewController.swift
//  JSWeiboDemo
//
//  Created by michael on 2017/6/15.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

private let identifier = "UITableViewCell"

class SettingViewController: UIViewController {
    
    var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "设置"
        self.view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    @objc private func logoff() {
        
    }
    
    fileprivate lazy var topLine: UIView = {
        let topLine = UIView()
        topLine.backgroundColor = RGB(r: 228, g: 228, b: 228)
        return topLine
    }()
    
    fileprivate lazy var bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = RGB(r: 228, g: 228, b: 228)
        return bottomLine
    }()
    
    fileprivate lazy var logoffButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(logoff), for: UIControlEvents.touchUpInside)
        button.setTitle("退出当前账号", for: UIControlState.normal)
        button.setTitleColor(RGB(r: 209, g: 82, b: 94), for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        return button
    }()
}

/// MARK: UITableViewDataSource、UITableViewDelegate
extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 4
        } else if section == 2 {
            return 4
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 2 {
            let contentView = setupFooterContentView()
            return contentView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 66
        }
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
}

/// 设置UI
extension SettingViewController {
    
    func setupUI() {
        setupTableView()
    }
    
    /// 设置tableView
    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.backgroundColor = RGB(r: 242, g: 242, b: 242)
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        view.addSubview(tableView!)
    }
    
    func setupFooterContentView() -> UIView {
        let contentView = UIView()
        contentView.backgroundColor = RGB(r: 242, g: 242, b: 242)
        
        contentView.addSubview(topLine)
        contentView.addSubview(bottomLine)
        contentView.addSubview(logoffButton)
        
        topLine.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
            make.height.equalTo(0.5)
        }
        
        logoffButton.snp.makeConstraints { (make) in
            make.top.equalTo(topLine.snp.bottom)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
            make.height.equalTo(50)
        }
        
        bottomLine.snp.makeConstraints { (make) in
            make.top.equalTo(logoffButton.snp.bottom)
            make.right.equalTo(contentView)
            make.left.equalTo(contentView)
            make.height.equalTo(0.5)
        }
        return contentView
    }
    
}
