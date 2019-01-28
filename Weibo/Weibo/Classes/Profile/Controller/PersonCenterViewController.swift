//
//  PersonCenterViewController.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/3/14.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

private let identifier = "UITableViewCell"

class PersonCenterViewController: UIViewController {
    
    var tableView: UITableView?
    fileprivate var statusBarShouldLight = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        self.navBarTintColor = .white
        self.navBarBgAlpha = 0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if statusBarShouldLight {
            return .lightContent
        } else {
            return .default
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/// MARK: UITableViewDataSource、UITableViewDelegate
extension PersonCenterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let redView = UIView()
        redView.backgroundColor = UIColor.red
        return redView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}

/// MARK: UITableViewDataSource、UITableViewDelegate
extension PersonCenterViewController: UIScrollViewDelegate {
    
    // MARK:UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        let showNavBarOffsetY = 200 - topLayoutGuide.length
        
        //navigationBar alpha
        if contentOffsetY > showNavBarOffsetY  {
            var navAlpha = (contentOffsetY - (showNavBarOffsetY)) / 40.0
            if navAlpha > 1 {
                navAlpha = 1
            }
            navBarBgAlpha = navAlpha
            if navAlpha > 0.8 {
                navBarTintColor = UIColor.defaultNavBarTintColor
                statusBarShouldLight = false
            } else {
                navBarTintColor = UIColor.white
                statusBarShouldLight = true
            }
        } else {
            navBarBgAlpha = 0
            navBarTintColor = UIColor.white
            statusBarShouldLight = true
        }
        setNeedsStatusBarAppearanceUpdate()
    }
}

/// 设置UI
extension PersonCenterViewController {
    
    func setupUI() {
        
        view.backgroundColor = UIColor.white
        setupTableView()
    }
    
    /// 设置tableView
    private func setupTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        if #available(iOS 11.0, *) {
            tableView?.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
        }
        view.addSubview(tableView!)
    }
}
