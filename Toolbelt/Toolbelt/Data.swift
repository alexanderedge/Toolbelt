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
        return (self as Data).hexadecimalString
    }
    
}

extension Data {
    
    public var hexadecimalString : String {
        var str = ""
        enumerateBytes { buffer, index, stop in
            for byte in buffer {
                str.append(String(format:"%02x",byte))
            }
        }
        return str
    }
    
}

