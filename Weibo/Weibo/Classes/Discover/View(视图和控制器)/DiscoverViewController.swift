//
//  DiscoverViewController.swift
//  SwiftActualCombat
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    fileprivate var searchBar: UISearchBar?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // visitorView?.setupVisiorViewInfo(imgName: "visitordiscover_image_message", title: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
        setupSearchBar()
    }
}

/// 设置UI
extension DiscoverViewController {
    
    func setupSearchBar() {
        
        self.searchBar = UISearchBar()
        self.searchBar?.barStyle = UIBarStyle.default
        self.searchBar?.searchBarStyle = UISearchBar.Style.minimal 
        self.searchBar?.placeholder = "大家正在搜：NBA颁奖典礼"
        self.navigationItem.titleView = self.searchBar
        
    }
}
