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
    public typealias TKColour = NSColor
#else
    import UIKit
    public typealias TKColour = UIColor
#endif

extension TKColour {
    
    private class func randomComponent() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255
    }
    
    public class func randomColor() -> TKColour {
        return TKColour(red: randomComponent(), green: randomComponent(), blue: randomComponent(), alpha: 1.0)
    }
    
}