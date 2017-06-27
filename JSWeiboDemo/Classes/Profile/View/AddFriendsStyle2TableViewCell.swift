//
//  AddFriendsStyle2TableViewCell.swift
//  JSWeiboDemo
//
//  Created by michael on 2017/6/27.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class AddFriendsStyle2TableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    fileprivate lazy var pictureImageView: UIImageView = {
        let pictureImageView = UIImageView()
        pictureImageView.backgroundColor = UIColor.red
        return pictureImageView
    }()
    
    fileprivate lazy var titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.font = UIFont.systemFont(ofSize: 16)
        titleLable.text = "全球奇事趣闻"
        return titleLable
    }()
    
    fileprivate lazy var subTitleLable: UILabel = {
        let subTitleLable = UILabel()
        subTitleLable.font = UIFont.systemFont(ofSize: 12)
        subTitleLable.textColor = UIColor.lightGray
        subTitleLable.text = "网罗天下奇人、奇事、奇物"
        return subTitleLable
    }()
    
    fileprivate lazy var descTitleLable: UILabel = {
        let descTitleLable = UILabel()
        descTitleLable.font = UIFont.systemFont(ofSize: 12)
        descTitleLable.textColor = UIColor.lightGray
        descTitleLable.text = "@如娃娃等156万人关注了"
        return descTitleLable
    }()
    
    fileprivate lazy var followButton: UIButton = {
        let followButton = UIButton()
        followButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        followButton.setTitleColor(UIColor.orange, for: UIControlState.normal)
        followButton.set(image: UIImage(named: "card_icon_addtogroup"), title: "加关注", titlePosition: .top, additionalSpacing: 30.0, state: .normal)
        return followButton
    }()
    
}

/// MARK: 设置UI
extension AddFriendsStyle2TableViewCell {
    
    func setupUI() {
        
        addSubview(pictureImageView)
        addSubview(titleLable)
        addSubview(descTitleLable)
        addSubview(subTitleLable)
        addSubview(followButton)
        
        pictureImageView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.width.height.equalTo(60)
        }
        
        subTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(pictureImageView.snp.right).offset(10)
            make.centerY.equalTo(pictureImageView.snp.centerY)
        }
        
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(pictureImageView.snp.right).offset(10)
            make.bottom.equalTo(subTitleLable.snp.top).offset(-5)
        }
        
        descTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(pictureImageView.snp.right).offset(10)
            make.top.equalTo(subTitleLable.snp.bottom).offset(5)
        }
        
        followButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(pictureImageView.snp.centerY)
            make.right.equalTo(self).offset(-15)
            make.width.height.equalTo(60)
        }
    }
}
