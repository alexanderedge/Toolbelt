//
//  Colour.swift
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

#if os(OSX)
    import AppKit.NSColor
    public typealias Colour = NSColor
#else
    import UIKit.UIColor
    public typealias Colour = UIColor
#endif

extension Colour {
    
    fileprivate class func randomComponent() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255
    }
    
    public class func randomColor() -> Colour {
        return Colour(red: randomComponent(), green: randomComponent(), blue: randomComponent(), alpha: 1.0)
    }
    
    public convenience init(integer red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        self.init(red : CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha) / 255)
    }
    
    public convenience init(hex : UInt32) {
        let red : UInt8 = (UInt8)((hex & 0xff0000) >> 16);
        let green : UInt8 = (UInt8)((hex & 0x00ff00) >> 8);
        let blue : UInt8 = (UInt8)(hex & 0x0000ff);
        self.init(integer: red, green: green, blue : blue, alpha : 255)
    }
    
    public convenience init(hexString : String) {
        var hex : UInt32 = 0
        Scanner(string: hexString.trimmingCharacters(in: CharacterSet(charactersIn: "#"))).scanHexInt32(&hex)
        self.init(hex : hex)
    }
    
    public var hex : UInt32 {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: nil)
        return UInt32(red * 255) << 16 | UInt32(green * 255) << 8 | UInt32(blue * 255)
    }
    
    public var hexString : String {
        return NSString(format: "#%06x", self.hex) as String
    }
    
}
