//
//  Colours.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 27/04/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

import Foundation

#if os(OSX)
    import AppKit
    typealias Colour = NSColor
#else
    import UIKit
    typealias Colour = UIColor
#endif

extension Colour {
    
    private class func randomComponent() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255
    }
    
    class func randomColor() -> Colour {
        return Colour(red: randomComponent(), green: randomComponent(), blue: randomComponent(), alpha: 1.0)
    }
    
}