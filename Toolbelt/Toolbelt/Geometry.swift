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
    
    public var center : CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    
    public var diagonal : CGFloat {
        return sqrt(pow(self.width,2) + pow(self.height,2))
    }

}

public func CGRectMake(_ center : CGPoint, size : CGSize) -> CGRect {
    return CGRect(center: center, size: size)
}

public func CGRectGetCenter(_ rect : CGRect) -> CGPoint {
    return rect.center
}

public func CGRectDiagonal(_ rect: CGRect) -> CGFloat {
    return rect.diagonal
}

// return rect2 that fits inside rect1, resizing and moving if necessary
public func CGRectInsideRect(_ rect1 : CGRect, rect2 : CGRect) -> CGRect {

    let width = min(rect1.width, rect2.width);
    let height = min(rect1.height, rect2.height);
    var xPos = max(rect1.minX, rect2.minX);
    var yPos = max(rect1.minY, rect2.minY);
    
    // check right
    if ((xPos + width) > rect1.maxX) {
        xPos = rect1.maxX - width;
    }
    
    // check bottom
    if ((yPos + height) > rect1.maxY) {
        yPos = rect1.maxY - height;
    }
    
    return CGRect(x: xPos, y: yPos, width: width, height: height);
}

protocol Scalable {
    func scaleBy(_ scale : CGFloat) -> Self
}

extension CGSize : Scalable {
    
    func scaleBy(_ scale: CGFloat) -> CGSize {
        
        guard scale > 0 else {
            fatalError("negative scale factor encountered")
        }
        
        return CGSize(width: self.width * scale, height: self.height * scale)
    }
    
}
