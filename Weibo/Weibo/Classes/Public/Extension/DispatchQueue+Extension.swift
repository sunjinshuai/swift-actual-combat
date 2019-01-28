//
//  DispatchQueue+Extension.swift
//  Weibo
//
//  Created by michael on 2019/1/28.
//  Copyright © 2019 michael. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    private static var onceTracker = [String]()
    
    public class func once(token: String, block: () -> Void) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        
        if onceTracker.contains(token) {
            return
        }
        
        onceTracker.append(token)
        block()
    }
}
