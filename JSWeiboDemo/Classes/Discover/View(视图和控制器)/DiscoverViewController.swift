//
//  DiscoverViewController.swift
//  JSWeiboDemo
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

class DiscoverViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         visitorView?.setupVisiorViewInfo(imgName: "visitordiscover_image_message", title: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过")
    }
}
