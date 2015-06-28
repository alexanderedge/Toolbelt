//
//  Geometry.swift
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

import CoreGraphics

extension CGRect {
    
    public init (center: CGPoint, size: CGSize) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: CGPoint(x: originX, y: originY), size: size)
    }
    
    public func center() -> CGPoint {
        return CGPointMake(CGRectGetMidX(self), CGRectGetMidY(self))
    }
    
    public func diagonal() -> CGFloat {
        return sqrt(pow(CGRectGetWidth(self),2) + pow(CGRectGetHeight(self),2))
    }

}

public func CGRectMakeWithCenter(center : CGPoint, size : CGSize) -> CGRect {
    return CGRect(center: center, size: size)
}

public func CGRectGetCenter(rect : CGRect) -> CGPoint {
    return rect.center()
}

public func CGRectDiagonal(rect: CGRect) -> CGFloat {
    return rect.diagonal()
}

// return rect2 that fits inside rect1, resizing and moving if necessary
public func CGRectInsideRect(rect1 : CGRect, rect2 : CGRect) -> CGRect {

    let width = min(CGRectGetWidth(rect1), CGRectGetWidth(rect2));
    let height = min(CGRectGetHeight(rect1), CGRectGetHeight(rect2));
    var xPos = max(CGRectGetMinX(rect1), CGRectGetMinX(rect2));
    var yPos = max(CGRectGetMinY(rect1), CGRectGetMinY(rect2));
    
    // check right
    if ((xPos + width) > CGRectGetMaxX(rect1)) {
        xPos = CGRectGetMaxX(rect1) - width;
    }
    
    // check bottom
    if ((yPos + height) > CGRectGetMaxY(rect1)) {
        yPos = CGRectGetMaxY(rect1) - height;
    }
    
    return CGRectMake(xPos, yPos, width, height);
}