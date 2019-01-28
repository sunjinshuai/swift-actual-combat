//
//  AppDelegate+3DTouch.swift
//  Weibo
//
//  Created by michael on 2019/1/28.
//  Copyright © 2019 michael. All rights reserved.
//

import UIKit

extension AppDelegate {
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
