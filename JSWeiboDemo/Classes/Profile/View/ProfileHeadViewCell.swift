//
//  ProfileHeadViewCell.swift
//  JSWeiboDemo
//
//  Created by michael on 2017/6/19.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class ProfileHeadViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func setupUI() {
        
        addSubview(avatarImageView)
        addSubview(titleLable)
        addSubview(subTitleLable)
        addSubview(arrowImageView)
        addSubview(describeLable)
        addSubview(splitLineView)
        
        avatarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.width.height.equalTo(60)
        }
        
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp.right).offset(10)
            make.top.equalTo(avatarImageView.snp.top).offset(10)
        }
        
        subTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp.right).offset(10)
            make.top.equalTo(titleLable.snp.bottom).offset(5)
        }
        
        arrowImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(avatarImageView.snp.centerY)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(10)
            make.width.equalTo(7)
        }
        
        describeLable.snp.makeConstraints { (make) in
            make.centerY.equalTo(avatarImageView.snp.centerY)
            make.right.equalTo(arrowImageView.snp.left).offset(-5)
        }
        
        splitLineView.snp.makeConstraints { (make) in
            make.top.equalTo(avatarImageView.snp.bottom).offset(15)
            make.left.right.equalTo(self)
            make.height.equalTo(0.5)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    fileprivate lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "avatar_default")
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.layer.masksToBounds = true
        return avatarImageView
    }()
    
    fileprivate lazy var titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.font = UIFont.boldSystemFont(ofSize: 16)
        titleLable.text = "测试测试测试"
        return titleLable
    }()
    
    fileprivate lazy var subTitleLable: UILabel = {
        let subTitleLable = UILabel()
        subTitleLable.font = UIFont.systemFont(ofSize: 14)
        subTitleLable.textColor = UIColor.lightGray
        subTitleLable.text = "简介简介简介简介"
        return subTitleLable
    }()
    
    fileprivate lazy var describeLable: UILabel = {
        let describeLable = UILabel()
        describeLable.font = UIFont.systemFont(ofSize: 12)
        describeLable.textColor = UIColor.orange
        describeLable.text = "抢千元红包"
        return describeLable
    }()
    
    fileprivate lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(named: "profile_arrow")
        return arrowImageView
    }()
    
    fileprivate lazy var splitLineView: UIView = {
        let splitLineView = UIView()
        splitLineView.backgroundColor = RGB(r: 221, g: 221, b: 221)
        return splitLineView
    }()
}
