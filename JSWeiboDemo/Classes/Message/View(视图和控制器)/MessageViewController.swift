//
//  MessageViewController.swift
//  JSWeiboDemo
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

class MessageViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorView?.setupVisiorViewInfo(imgName: "visitordiscover_image_message", title: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知")
    }
}
