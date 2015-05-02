//
//  Colour.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 27/04/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

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
    
}