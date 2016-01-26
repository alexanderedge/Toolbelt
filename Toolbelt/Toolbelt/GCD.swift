//
//  GCD.swift
//  Toolbelt
//
//  Created by Alexander Edge on 14/01/2016.
//  Copyright © 2016 Alexander Edge. All rights reserved.
//

import Foundation

public enum Queue {
    case Main
    case UserInteractive
    case UserInitiated
    case Utility
    case Background
    
    public var queue: dispatch_queue_t {
        switch self {
        case .Main:
            return dispatch_get_main_queue()
        case .UserInteractive:
            return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)
        case .UserInitiated:
            return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
        case .Utility:
            return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
        case .Background:
            return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
        }
    }
    
    public func execute(closure: () -> Void) {
        dispatch_async(self.queue, closure)
    }
    
    public func execute(after: NSTimeInterval, closure: () -> Void) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(after * Double(NSEC_PER_SEC))), self.queue, closure)
    }
    
}
