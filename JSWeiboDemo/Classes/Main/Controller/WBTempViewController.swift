//
//  WBTempViewController.swift
//  JSWeiboDemo
//
//  Created by Michael on 2017/2/26.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class WBTempViewController: WBBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setupNavigationItem()
    }
    
    //MARK: - 设置导航
    private func setupNavigationItem() {
        // 右侧
        navItem.rightBarButtonItem = UIBarButtonItem(imgName: nil, title: "下一个", target: self, action: #selector(pushToNextController))
    }

}

//MARK: - 监听事件
extension WBTempViewController {
    /*
     private 私有的在自己类内部使用没有问题 但是 如果吧方法放到其类的extension 就会找不到该方法 需要使用fileprivate 来修饰
     */
    // 右侧按钮点击
    @objc fileprivate func pushToNextController(){
    
        let temp = WBTempViewController()
        self.navigationController?.pushViewController(temp, animated: true)
    }
}
