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
    
    private class func randomComponent() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255
    }
    
    public class func randomColor() -> Colour {
        return Colour(red: randomComponent(), green: randomComponent(), blue: randomComponent(), alpha: 1.0)
    }
    
    public convenience init(integer red: Int, green: Int, blue: Int, alpha: Int) {
        self.init(red : CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha) / 255)
    }
    
    public convenience init(hex : Int) {
        let red = (hex & 0xff000000) >> 24;
        let green = (hex & 0x00ff0000) >> 16;
        let blue = (hex & 0x0000ff00) >> 8;
        let alpha = (hex & 0x000000ff);
        self.init(integer: red, green: green, blue : blue, alpha : alpha)
    }
    
}