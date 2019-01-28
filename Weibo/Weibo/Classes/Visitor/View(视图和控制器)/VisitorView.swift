//
//  VisitorView.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/3/6.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

// MARK: - Delegate
@objc protocol VisitorViewDelegate: NSObjectProtocol {
    func login()
    func register()
}

class VisitorView: UIView {
    
    weak var delegate: VisitorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 监听事件
    @objc private func login(){
        delegate?.login()
    }
    
    @objc private func register(){
        delegate?.register()
    }
    
    // MARK: - 供外界设置的方法
    func setupVisiorViewInfo(imgName: String?, title: String?) {
        
        if let imgName = imgName {
            houseImageView.image = UIImage(named: imgName)
            iconImageView.isHidden = true
        }
        setupFeedImageViewAnim()
        titleLable.text = title
    }
    
    // MARK: - 懒加载
    fileprivate lazy var iconImageView: UIImageView = UIImageView.init(imageName: "visitordiscover_feed_image_smallicon")
    
    fileprivate lazy var maskImageView: UIImageView = UIImageView.init(imageName: "visitordiscover_feed_mask_smallicon")
    
    fileprivate lazy var houseImageView: UIImageView = UIImageView.init(imageName: "visitordiscover_feed_image_house")
    
    fileprivate lazy var titleLable: UILabel = {
        let lab = UILabel(fontSize: 14.0,
                          textColor: RGB(r: 208, g: 208, b: 208))
        // 换行
        lab.numberOfLines = 0
        // 对齐方式
        lab.textAlignment = .center
        return lab
    }()
    
    // 登录按钮
    fileprivate lazy var loginButton: UIButton = {
        let btn = UIButton()
        // 点击事件
        btn.addTarget(self, action: #selector(login), for: UIControl.Event.touchUpInside)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"common_button_white"), for: UIControl.State.normal)
        // 设置文字
        btn.setTitle("登录", for: UIControl.State.normal)
        // 设置文字颜色
        btn.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        btn.setTitleColor(UIColor.orange, for: UIControl.State.highlighted)
        // 设置字体大小
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        return btn
    }()
    
    // 注册按钮
    fileprivate lazy var registerButton: UIButton = {
        let btn = UIButton()
        // 点击事件
        btn.addTarget(self, action: #selector(register), for: UIControl.Event.touchUpInside)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named:"common_button_white"), for: UIControl.State.normal)
        // 设置文字
        btn.setTitle("注册", for: UIControl.State.normal)
        // 设置文字颜色
        btn.setTitleColor(UIColor.darkGray, for: UIControl.State.normal)
        btn.setTitleColor(UIColor.orange, for: UIControl.State.highlighted)
        // 设置字体大小
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        return btn
    }()
}

extension VisitorView {
    
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
    
}

// MARK: - 设置界面
extension VisitorView {
    
    func setupUI() {
        
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
}
