//
//  Async.swift
//  Toolbelt
//
//  Created by Alexander Edge on 03/12/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import Foundation

public func dispatch_after(delay : NSTimeInterval, block: dispatch_block_t) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), block)
}

public func dispatch_async_main(block : dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue(), block)
}
