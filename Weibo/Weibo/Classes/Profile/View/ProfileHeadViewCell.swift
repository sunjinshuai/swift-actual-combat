//
//  ProfileHeadViewCell.swift
//  SwiftActualCombat
//
//  Created by michael on 2017/6/19.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

protocol ProfileHeadViewCellDelegate: NSObjectProtocol {
    func profileHeadViewTouchToPersonCenter()
}

class ProfileHeadViewCell: UITableViewCell {
    
    var delegate: ProfileHeadViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate lazy var avatarImageView: UIButton = {
        let avatarImageView = UIButton(type: UIButton.ButtonType.custom)
        avatarImageView.setBackgroundImage(UIImage(named: "avatar_default"), for: UIControl.State.normal)
        avatarImageView.addTarget(self, action: #selector(eventToPersonCenter), for: UIControl.Event.touchUpInside)
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
    
    fileprivate lazy var leftView: ProfileHeadItemView = {
        let leftView = ProfileHeadItemView()
        leftView.titleLable.text = "1362"
        leftView.subTitleLable.text = "微博"
        return leftView
    }()
    
    fileprivate lazy var middleView: ProfileHeadItemView = {
        let middleView = ProfileHeadItemView()
        middleView.titleLable.text = "136"
        middleView.subTitleLable.text = "关注"
        return middleView
    }()
    
    fileprivate lazy var rightView: ProfileHeadItemView = {
        let rightView = ProfileHeadItemView()
        rightView.titleLable.text = "362"
        rightView.subTitleLable.text = "粉丝"
        return rightView
    }()
}

/// MARK: - 监听事件
extension ProfileHeadViewCell {
    
    @objc fileprivate func eventToPersonCenter() {
        delegate?.profileHeadViewTouchToPersonCenter()
    }
}


/// MARK: 设置UI
extension ProfileHeadViewCell {
    
    func setupUI() {
        
        addSubview(avatarImageView)
        addSubview(titleLable)
        addSubview(subTitleLable)
        addSubview(arrowImageView)
        addSubview(describeLable)
        addSubview(splitLineView)
        addSubview(leftView)
        addSubview(middleView)
        addSubview(rightView)
        
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
        
        middleView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(splitLineView.snp.bottom).offset(5)
            make.bottom.equalTo(self).offset(-10)
            make.width.equalTo((UIScreen.main.bounds.size.width - 30) / 3)
        }
        
        leftView.snp.makeConstraints { (make) in
            make.top.equalTo(middleView)
            make.left.equalTo(15)
            make.right.equalTo(middleView.snp.left)
            make.bottom.equalTo(middleView)
            make.width.equalTo((UIScreen.main.bounds.size.width - 30) / 3)
        }
        
        rightView.snp.makeConstraints { (make) in
            make.top.equalTo(middleView)
            make.bottom.equalTo(middleView)
            make.right.equalTo(self).offset(-15)
            make.left.equalTo(middleView.snp.right)
            make.width.equalTo((UIScreen.main.bounds.size.width - 30) / 3)
        }
    }
}
