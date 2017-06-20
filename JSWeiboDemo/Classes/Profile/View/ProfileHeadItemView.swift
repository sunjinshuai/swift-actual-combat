//
//  ProfileHeadItemView.swift
//  JSWeiboDemo
//
//  Created by michael on 2017/6/20.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class ProfileHeadItemView: UIView {
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.font = UIFont.systemFont(ofSize: 16)
        titleLable.text = "测试测试测试"
        return titleLable
    }()
    
    lazy var subTitleLable: UILabel = {
        let subTitleLable = UILabel()
        subTitleLable.font = UIFont.systemFont(ofSize: 14)
        subTitleLable.textColor = UIColor.lightGray
        subTitleLable.text = "简介简介简介简介"
        return subTitleLable
    }()
}

/// MARK: 设置UI
extension ProfileHeadItemView {
    
    func setupUI() {
        
        addSubview(titleLable)
        addSubview(subTitleLable)
        
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        subTitleLable.snp.makeConstraints { (make) in
            make.top.equalTo(titleLable.snp.bottom).offset(3)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
}
