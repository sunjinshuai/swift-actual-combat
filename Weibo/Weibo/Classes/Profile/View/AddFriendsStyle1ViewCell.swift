//
//  AddFriendsStyle1ViewCell.swift
//  SwiftActualCombat
//
//  Created by michael on 2017/6/27.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

class AddFriendsStyle1ViewCell: UITableViewCell {

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
        titleLable.text = "扫一扫"
        return titleLable
    }()
    
    fileprivate lazy var subTitleLable: UILabel = {
        let subTitleLable = UILabel()
        subTitleLable.font = UIFont.systemFont(ofSize: 12)
        subTitleLable.textColor = UIColor.lightGray
        subTitleLable.text = "扫描二维码名片"
        return subTitleLable
    }()
    
    fileprivate lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(named: "profile_arrow")
        return arrowImageView
    }()

}

/// MARK: 设置UI
extension AddFriendsStyle1ViewCell {
    
    func setupUI() {
        
        addSubview(pictureImageView)
        addSubview(titleLable)
        addSubview(subTitleLable)
        addSubview(arrowImageView)
        
        pictureImageView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.width.height.equalTo(50)
        }
        
        titleLable.snp.makeConstraints { (make) in
            make.left.equalTo(pictureImageView.snp.right).offset(10)
            make.top.equalTo(pictureImageView.snp.top).offset(5)
        }
        
        subTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(pictureImageView.snp.right).offset(10)
            make.top.equalTo(titleLable.snp.bottom).offset(5)
        }
        
        arrowImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(pictureImageView.snp.centerY)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(10)
            make.width.equalTo(7)
        }
    }
}
