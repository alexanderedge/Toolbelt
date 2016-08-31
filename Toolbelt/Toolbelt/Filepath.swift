//
//  Filepath.swift
//  Toolbelt
//
//  The MIT License (MIT)
//
//  Copyright (c) 02/05/2015 Alexander G Edge
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

extension String {
    
    public static func temporaryFilePathWithExtension(_ ext : String?) -> String {
        let tmpDir = NSTemporaryDirectory() as NSString
        let file = tmpDir.appendingPathComponent(UUID().uuidString)
        guard let ext = ext else {
            return file
        }
        return file.stringByAppendingPathExtension(ext)!
    }
    
    public static func temporaryFilePath () -> String {
        return temporaryFilePathWithExtension(nil)
    }
    
    public func stringByAppendingPathComponent(_ component : String) -> String {
        return (self as NSString).appendingPathComponent(component) as String
    }
    
    public func stringByAppendingPathExtension(_ ext : String) -> String? {
        return (self as NSString).appendingPathExtension(ext)
    }
    
}

extension URL {
    
    public static func temporaryFileURLWithExtension(_ ext : String?) -> URL {
        return URL(fileURLWithPath: String.temporaryFilePathWithExtension(ext))
    }
    
    public static func temporaryFileURL() -> URL {
        return URL(fileURLWithPath: String.temporaryFilePath())
    }
    
}

extension NSURL {
    
    public static func temporaryFileURLWithExtension(_ ext : String?) -> NSURL {
        return URL.temporaryFileURLWithExtension(ext) as NSURL
    }
    
    public static func temporaryFileURL() -> NSURL {
        return URL.temporaryFileURL() as NSURL
    }
    
}

extension FileManager {
    
    public func applicationDocumentsDirectory() -> URL {
        return urls(for: .documentDirectory, in: .userDomainMask).last as URL!
    }
    
}
