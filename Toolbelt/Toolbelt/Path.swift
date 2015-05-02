//
//  Path.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 02/05/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

import Foundation

extension String {
    
    public static func temporaryFilePathWithExtension(ext : String?) -> String {
        let path = NSTemporaryDirectory().stringByAppendingPathComponent(NSUUID().UUIDString)
        if (ext != nil) {
            return path.stringByAppendingPathExtension(ext!)!
        } else {
            return path
        }
    }
    
    public static func temporaryFilePath () -> String {
        return temporaryFilePathWithExtension(nil)
    }
    
}

extension NSURL {
    
    public class func temporaryFileURLWithExtension(ext : String?) -> NSURL {
        return NSURL(string: String.temporaryFilePathWithExtension(ext))!
    }
    
    public class func temporaryFileURL() -> NSURL {
        return NSURL(string: String.temporaryFilePath())!
    }
    
}