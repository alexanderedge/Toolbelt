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
        var bytes = [UInt8](count: self.length, repeatedValue: 0)
        self.getBytes(&bytes, length: self.length)
        return bytes.reduce(""){ return $0 + String(format:"%02x",$1)}
    }
    
}