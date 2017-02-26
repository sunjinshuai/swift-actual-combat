//
//  WBBaseViewController.swift
//  JSWeiboDemo
//
//  Created by Michael on 2017/2/26.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class WBBaseViewController: UIViewController {
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
}

extension WBBaseViewController {

    func setupNavigationBar () {
    
        view.backgroundColor = UIColor.white
        view.addSubview(navigationBar)
    }
}
