//
//  ProfileViewCell.swift
//  JSWeiboDemo
//
//  Created by michael on 2017/6/19.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class ProfileViewCell: UITableViewCell {
    
    var profileModel: ProfileModel? {
        didSet {
            guard let profileModel = profileModel else {
                return
            }
            avatarImageView.image = UIImage(named: profileModel.profile_image!)
            titleLable.text = profileModel.profile_titleName
            subTitleLable.text = profileModel.profile_subTitleName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        
        addSubview(avatarImageView)
        addSubview(titleLable)
        addSubview(subTitleLable)
        addSubview(arrowImageView)
        
        avatarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.width.height.equalTo(20)
        }
        
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp.right).offset(10)
            make.centerY.equalTo(avatarImageView.snp.centerY)
        }
        
        subTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(titleLable.snp.right).offset(10)
            make.centerY.equalTo(titleLable.snp.centerY)
        }
        
        arrowImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(avatarImageView.snp.centerY)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(10)
            make.width.equalTo(7)
        }
    }
    
    fileprivate lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.backgroundColor = UIColor.red
        return avatarImageView
    }()
    
    fileprivate lazy var titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.font = UIFont.systemFont(ofSize: 16)
        titleLable.text = "我的相册"
        return titleLable
    }()
    
    fileprivate lazy var subTitleLable: UILabel = {
        let subTitleLable = UILabel()
        subTitleLable.font = UIFont.systemFont(ofSize: 12)
        subTitleLable.textColor = UIColor.lightGray
        subTitleLable.text = "全民热舞抢红包"
        return subTitleLable
    }()
    
    fileprivate lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(named: "profile_arrow")
        return arrowImageView
    }()
}
