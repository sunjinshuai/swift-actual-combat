//
//  VisitorView.swift
//  JSWeiboDemo
//
//  Created by Michael on 2017/3/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 监听事件
    @objc private func loginButtonClick(){
       
    }
    
    @objc private func registerButtonClick(){
        
    }
    
    private func setupUI() {
        backgroundColor = RGB(r: 235, g: 235, b: 235)
        addSubview(iconImageView)
        addSubview(houseImageView)
        addSubview(titleLable)
        addSubview(loginButton)
        addSubview(registerButton)
        
        iconImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        houseImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
    }
    
    // MARK: - 懒加载
    private lazy var iconImageView: UIImageView = UIImageView.init(imageName: "visitordiscover_feed_image_smallicon")

    private lazy var houseImageView: UIImageView = UIImageView.init(imageName: "visitordiscover_feed_image_house")
    
    private lazy var titleLable: UILabel = {
        let lab = UILabel(fontSize: 14.0,
                          textColor: UIColor.darkGray,
                          text: "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜")
        // 换行
        lab.numberOfLines = 0
        // 对齐方式
        lab.textAlignment = .center
        return lab
    }()
    
    // 登录按钮
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        // 点击事件
        btn.addTarget(self, action: #selector(loginButtonClick), for: UIControlEvents.touchUpInside)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"common_button_white"), for: UIControlState.normal)
        // 设置文字
        btn.setTitle("登录", for: UIControlState.normal)
        // 设置文字颜色
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.setTitleColor(UIColor.orange, for: UIControlState.highlighted)
        // 设置字体大小
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()
    
    // 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        // 点击事件
        btn.addTarget(self, action: #selector(registerButtonClick), for: UIControlEvents.touchUpInside)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"common_button_white"), for: UIControlState.normal)
        // 设置文字
        btn.setTitle("注册", for: UIControlState.normal)
        // 设置文字颜色
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.setTitleColor(UIColor.orange, for: UIControlState.highlighted)
        // 设置字体大小
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return btn
    }()
}
