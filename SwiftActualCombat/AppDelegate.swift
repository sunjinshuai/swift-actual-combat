//
//  AppDelegate.swift
//  SwiftActualCombat
//
//  Created by 孙金帅 on 16/8/12.
//  Copyright © 2016年 com.51fanxing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.backgroundColor = UIColor.black
        window?.rootViewController = WBTabBarController()
        window?.makeKeyAndVisible()
        
        register3DTouch()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
    }
    
    func register3DTouch() {
        
        let icon1: UIApplicationShortcutIcon = UIApplicationShortcutIcon(templateImageName: "fx_3dtouch_scan")
        let icon2: UIApplicationShortcutIcon = UIApplicationShortcutIcon(templateImageName: "fx_3dtouch_search")
        let icon3: UIApplicationShortcutIcon = UIApplicationShortcutIcon(templateImageName: "fx_3dtouch_receipt_of_goods")
        let icon4: UIApplicationShortcutIcon = UIApplicationShortcutIcon(templateImageName: "fx_3dtouch_star_ticket")
        let item1: UIMutableApplicationShortcutItem = UIMutableApplicationShortcutItem(type: "com.51fanxing.scanQR", localizedTitle: "扫一扫", localizedSubtitle: nil, icon: icon1, userInfo: nil)
        let item2: UIMutableApplicationShortcutItem = UIMutableApplicationShortcutItem(type: "com.51fanxing.search", localizedTitle: "搜索", localizedSubtitle: nil, icon: icon2, userInfo: nil)
        let item3: UIMutableApplicationShortcutItem = UIMutableApplicationShortcutItem(type: "com.51fanxing.receiptOfGoods", localizedTitle: "查物流", localizedSubtitle: nil, icon: icon3, userInfo: nil)
        let item4: UIMutableApplicationShortcutItem = UIMutableApplicationShortcutItem(type: "com.51fanxing.starTicket", localizedTitle: "摇一摇", localizedSubtitle: nil, icon: icon4, userInfo: nil)
        UIApplication.shared.shortcutItems = [item1, item2, item3, item4]
    }
}

