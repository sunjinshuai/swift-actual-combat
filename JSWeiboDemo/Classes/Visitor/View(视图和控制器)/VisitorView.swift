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
    @objc private func login(){
        
    }
    
    @objc private func register(){
        
    }
    
    // MARK: - 供外界设置的方法
    func setupVisiorViewInfo(imgName: String?, title: String?) {
        if let imgName = imgName {
            houseImageView.image = UIImage(named: imgName)
            iconImageView.isHidden = true
        } else {
        }
        setupFeedImageViewAnim()
        titleLable.text = title
    }
    
    // 设置圆圈动画
    func setupFeedImageViewAnim(){
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
        iconImageView.layer.add(anim, forKey: nil)
    }
    
    private func setupUI() {
        backgroundColor = RGB(r: 237, g: 237, b: 237)
        addSubview(iconImageView)
        addSubview(maskImageView)
        addSubview(houseImageView)
        addSubview(titleLable)
        addSubview(loginButton)
        addSubview(registerButton)
        
        iconImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        maskImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        houseImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(maskImageView.snp.bottom).offset(16)
            make.centerX.equalTo(self)
            make.width.equalTo(230)
        }
        loginButton.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable)
            make.top.equalTo(titleLable.snp.bottom).offset(16)
            make.size.equalTo(CGSize(width: 100, height: 35))
        }
        registerButton.snp.makeConstraints { (make) in
            make.size.equalTo(loginButton)
            make.top.equalTo(loginButton)
            make.right.equalTo(titleLable)
        }
    }
    
    // MARK: - 懒加载
    private lazy var iconImageView: UIImageView = UIImageView.init(imageName: "visitordiscover_feed_image_smallicon")
    
    private lazy var maskImageView: UIImageView = UIImageView.init(imageName: "visitordiscover_feed_mask_smallicon")
    
    private lazy var houseImageView: UIImageView = UIImageView.init(imageName: "visitordiscover_feed_image_house")
    
    private lazy var titleLable: UILabel = {
        let lab = UILabel(fontSize: 12.0,
                          textColor: RGB(r: 208, g: 208, b: 208))
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
        btn.addTarget(self, action: #selector(login), for: UIControlEvents.touchUpInside)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"common_button_white"), for: UIControlState.normal)
        // 设置文字
        btn.setTitle("登录", for: UIControlState.normal)
        // 设置文字颜色
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.setTitleColor(UIColor.orange, for: UIControlState.highlighted)
        // 设置字体大小
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        return btn
    }()
    
    // 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        // 点击事件
        btn.addTarget(self, action: #selector(register), for: UIControlEvents.touchUpInside)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"common_button_white"), for: UIControlState.normal)
        // 设置文字
        btn.setTitle("注册", for: UIControlState.normal)
        // 设置文字颜色
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.setTitleColor(UIColor.orange, for: UIControlState.highlighted)
        // 设置字体大小
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        return btn
    }()
}
