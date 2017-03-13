//
//  UIViewController+Extension.swift
//  JSWeiboDemo
//
//  Created by Michael on 2017/3/13.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

extension UIViewController {
    
    fileprivate struct AssociatedKeys {
        static var navBarBgAlpha: CGFloat = 1.0
        static var navBarTintColor: UIColor = UIColor.defaultNavBarTintColor()
    }
    
    open var navBarBgAlpha: CGFloat {
        get {
            let alpha = objc_getAssociatedObject(self, &AssociatedKeys.navBarBgAlpha) as? CGFloat
            if alpha == nil {
                return 1.0
            }else{
                return alpha!
            }
            
        }
        set {
            var alpha = newValue
            if alpha > 1 {
                alpha = 1
            }
            if alpha < 0 {
                alpha = 0
            }
            
            objc_setAssociatedObject(self, &AssociatedKeys.navBarBgAlpha, alpha, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            //Update UI
            navigationController?.setNeedsNavigationBackground(alpha: alpha)
        }
    }
    
    open var navBarTintColor: UIColor {
        get {
            let tintColor = objc_getAssociatedObject(self, &AssociatedKeys.navBarTintColor) as? UIColor
            if tintColor == nil {
                return UIColor.defaultNavBarTintColor()
            }else{
                return tintColor!
            }
            
        }
        set {
            navigationController?.navigationBar.tintColor = newValue
            objc_setAssociatedObject(self, &AssociatedKeys.navBarTintColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
}
