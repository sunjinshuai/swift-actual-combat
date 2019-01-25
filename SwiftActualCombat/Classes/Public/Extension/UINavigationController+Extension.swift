//
//  UINavigationController+Extension.swift
//  SwiftActualCombat
//
//  Created by Michael on 2017/3/13.
//  Copyright © 2017年 com.51fanxing. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
    
    open override class func initialize(){
        
        if self == UINavigationController.self {
            let originalSelectorArray = ["_updateInteractiveTransition:"]
            
            for original in originalSelectorArray {
                let originalSelector = NSSelectorFromString(original)
                let swizzledSelector = NSSelectorFromString("_\(original)")
                let originalMethod = class_getInstanceMethod(self.classForCoder(), originalSelector)
                let swizzledMethod = class_getInstanceMethod(self.classForCoder(), swizzledSelector)
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
    }
    
    func __updateInteractiveTransition(_ percentComplete: CGFloat) {
        __updateInteractiveTransition(percentComplete)
        let topViewController = self.topViewController
        if topViewController != nil {
            let coor = topViewController?.transitionCoordinator
            if coor != nil {
                // BackgroundColor Alpha
                let fromAlpha = coor?.viewController(forKey: .from)?.navBarBackgroundColorAlpha
                let toAlpha = coor?.viewController(forKey: .to)?.navBarBackgroundColorAlpha
                let nowAlpha = fromAlpha! + (toAlpha! - fromAlpha!) * percentComplete
                
                self.setNeedsNavigationBackground(alpha: nowAlpha)
                
                // TintColor
                let fromColor = coor?.viewController(forKey: .from)?.navBarTintColor
                let toColor = coor?.viewController(forKey: .to)?.navBarTintColor
                let nowColor = averageColor(fromColor: fromColor!, toColor: toColor!, percent: percentComplete)
                self.navigationBar.tintColor = nowColor
            }
        }
    }
    
    private func averageColor(fromColor:UIColor, toColor:UIColor, percent:CGFloat) -> UIColor {
        var fromRed: CGFloat = 0.0
        var fromGreen: CGFloat = 0.0
        var fromBlue: CGFloat = 0.0
        var fromAlpha: CGFloat = 0.0
        fromColor.getRed(&fromRed, green: &fromGreen, blue: &fromBlue, alpha: &fromAlpha)
        
        var toRed: CGFloat = 0.0
        var toGreen: CGFloat = 0.0
        var toBlue: CGFloat = 0.0
        var toAlpha: CGFloat = 0.0
        toColor.getRed(&toRed, green: &toGreen, blue: &toBlue, alpha: &toAlpha)
        
        let nowRed = fromRed + (toRed - fromRed) * percent
        let nowGreen = fromGreen + (toGreen - fromGreen) * percent
        let nowBlue = fromBlue + (toBlue - fromBlue) * percent
        let nowAlpha = fromAlpha + (toAlpha - fromAlpha) * percent
        
        return UIColor(red: nowRed, green: nowGreen, blue: nowBlue, alpha: nowAlpha)
    }
    
    func setNeedsNavigationBackground(alpha:CGFloat) {
        
        let barBackgroundView = navigationBar.subviews[0]
        if let shadowView = barBackgroundView.value(forKey: "_shadowView") as? UIView {
            shadowView.alpha = alpha
        }
        
        if navigationBar.isTranslucent {
            if #available(iOS 10.0, *){
                if navigationBar.backgroundImage(for: .default) == nil {
                    if let backgroundEffectView = barBackgroundView.value(forKey: "_backgroundEffectView") as? UIView {
                        backgroundEffectView.alpha = alpha
                        return
                    }
                }
            } else {
                if let adaptiveBackdrop = barBackgroundView.value(forKey: "_adaptiveBackdrop") as? UIView {
                    if let backdropEffectView = adaptiveBackdrop.value(forKey: "_backdropEffectView") as? UIView {
                        backdropEffectView.alpha = alpha
                        return
                    }
                }
            }
        }
        barBackgroundView.alpha = alpha
    }
}

extension UINavigationController:UINavigationControllerDelegate,UINavigationBarDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let topViewController = navigationController.topViewController
        if topViewController != nil {
            let coor = topViewController?.transitionCoordinator
            if coor != nil {
                if #available(iOS 10.0, *) {
                    coor?.notifyWhenInteractionChanges({ (context) in
                        self.dealInteractionChanges(context)
                    })
                } else {
                    coor?.notifyWhenInteractionEnds({ (context) in
                        self.dealInteractionChanges(context)
                    })
                }
            }
        }
    }
    
    private func dealInteractionChanges(_ context:UIViewControllerTransitionCoordinatorContext) {
        if context.isCancelled {
            let cancellDuration:TimeInterval = context.transitionDuration * Double( context.percentComplete)
            UIView.animate(withDuration: cancellDuration, animations: {
                
                let nowAlpha = (context.viewController(forKey: .from)?.navBarBackgroundColorAlpha)!
                self.setNeedsNavigationBackground(alpha: nowAlpha)
                
                self.navigationBar.tintColor = context.viewController(forKey: .from)?.navBarTintColor
            })
        } else {
            let finishDuration:TimeInterval = context.transitionDuration * Double(1 - context.percentComplete)
            UIView.animate(withDuration: finishDuration, animations: {
                let nowAlpha = (context.viewController(forKey: .to)?.navBarBackgroundColorAlpha)!
                self.setNeedsNavigationBackground(alpha: nowAlpha)
                
                self.navigationBar.tintColor = context.viewController(forKey: .to)?.navBarTintColor
            })
        }
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        
        if viewControllers.count >= (navigationBar.items?.count)! {
            let popToVC = viewControllers[viewControllers.count-2]
            setNeedsNavigationBackground(alpha: (popToVC.navBarBackgroundColorAlpha))
            navigationBar.tintColor = popToVC.navBarTintColor
            
            _ = self.popViewController(animated: true)
        }
        return true
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        setNeedsNavigationBackground(alpha: (topViewController?.navBarBackgroundColorAlpha)!)
        navigationBar.tintColor = topViewController?.navBarTintColor
        return true
    }
    
}


