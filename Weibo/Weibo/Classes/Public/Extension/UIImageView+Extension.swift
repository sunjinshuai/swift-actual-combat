//
//  UIImageView+Extension.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/2/26.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// UIImageView便利构造函数
    ///
    /// - Parameter imgName: 传入图片的名称
    convenience init(imageName: String) {
        self.init(image: UIImage(named:imageName))
    }
}
