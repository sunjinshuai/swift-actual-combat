//
//  WBVisitorView.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/2/26.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit
import SnapKit

protocol WBVisitorViewDelegate: NSObjectProtocol {
    // 协议方法
    func visitorViewButtonClick()
}

class WBVisitorView: UIView {

    // 声明代理
    weak var delegate:WBVisitorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 监听事件
    @objc private func buttonClick() {
 
        print("登陆")
    }
    
    // MARK: - 供外界设置的方法
    func setupVisiorViewInfo(imgName: String?, title: String?) {
        // 代表是消息 发现 我
        if let img = imgName, let tit = title {
            // 重新赋值
            iconImageView.image = UIImage(named: img)
            messageLabel.text = tit
            // 隐藏圆圈图片
            feedImageView.isHidden = true
        } else {
            // 代表是首页
            // 执行动画
            setupFeedImageViewAnim()
        }
    }
    
    // 设置圆圈动画
    func setupFeedImageViewAnim() {
        // 核心动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 设置toValue
        anim.toValue = M_PI * 2
        // 设置时长
        anim.duration = 20
        // 重复次数
        anim.repeatCount = MAXFLOAT
        // 当切换控制器 或者程序退到后台 默认动画会被移除
        anim.isRemovedOnCompletion = false
        // 添加动画
        feedImageView.layer.add(anim, forKey: nil)
    }
    
    // MARK: - 设置视图
    private func setupUI() {
        backgroundColor = RGB(r: 235, g: 235, b: 235)
        // 01 添加控件
        addSubview(feedImageView)
        addSubview(maskImageView)
        addSubview(iconImageView)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        // 02 添加约束
        feedImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        maskImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        iconImageView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        messageLabel.snp_makeConstraints { (make) in
            make.top.equalTo(maskImageView.snp_bottom).offset(16)
            make.width.equalTo(230)
            make.centerX.equalTo(self)
        }
        
        loginButton.snp_makeConstraints { (make) in
            make.left.equalTo(messageLabel)
            make.top.equalTo(messageLabel.snp_bottom).offset(16)
            make.size.equalTo(CGSize(width: 100, height: 35))
        }
        
        registerButton.snp_makeConstraints { (make) in
            make.size.equalTo(loginButton)
            make.top.equalTo(loginButton)
            make.right.equalTo(messageLabel)
        }
    }
    
    // MARK: - 懒加载控件
    // 圆圈图片
    private lazy var feedImageView: UIImageView = UIImageView(imageName: "visitordiscover_feed_image_smallicon")
    // 遮挡
    private lazy var maskImageView: UIImageView = UIImageView(imageName: "visitordiscover_feed_mask_smallicon")
    // icon
    private lazy var iconImageView: UIImageView = UIImageView(imageName: "visitordiscover_feed_image_house")
    // 文字
    lazy var messageLabel: UILabel = {
        let lab = UILabel(fontSize: 14.0, textColor: UIColor.darkGray, text: "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜")
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
        btn.addTarget(self, action: #selector(buttonClick), for: UIControlEvents.touchUpInside)
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
        btn.addTarget(self, action: #selector(buttonClick), for: UIControlEvents.touchUpInside)
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
