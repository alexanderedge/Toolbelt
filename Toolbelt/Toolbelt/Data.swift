//
//  String.swift
//  Toolbelt
//
//  Created by Alexander Edge on 08/12/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import Foundation

extension NSData {
    
    public var hexadecimalString : String {
        var str = String()
        var bytes = [UInt8](count: self.length, repeatedValue: 0)
        self.getBytes(&bytes, length: self.length)
        for byte in bytes {
            str += String(format: "%02x",byte)
        }
        return str
    }
    
}