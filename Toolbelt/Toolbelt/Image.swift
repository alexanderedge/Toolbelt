//
//  Image.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 02/05/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

import Foundation
import CoreGraphics

#if os(OSX)
    import AppKit.NSImage
    public typealias Image = NSImage
    
    extension Image {
        
        public convenience init?(CGImage cgImage: CGImage) {
            self.init(CGImage : cgImage, size: CGSizeZero);
        }
    
        public class func imageWithColour(colour:Colour, size:CGSize) -> Image {
            let width : size_t = Int(size.width)
            let height : size_t = Int(size.height)
            let bitsPerComponent : size_t = 8 * 4
            let bytesPerRow : size_t = 0
            let colourSpace = CGColorSpaceCreateDeviceRGB()
            let bitmapInfo = CGBitmapInfo(CGImageAlphaInfo.PremultipliedLast.rawValue)
            let ctx = CGBitmapContextCreate(nil, width, height, bitsPerComponent, bytesPerRow, colourSpace, bitmapInfo)
            colour.setFill()
            CGContextFillRect(ctx,CGRect(origin: CGPointZero,size:size));
            return Image(CGImage:CGBitmapContextCreateImage(ctx))!
        }
    
    }
    
#else
    import UIKit.UIImage
    public typealias Image = UIImage
    
    extension Image {
    
        public class func imageWithColour(colour:Colour, size:CGSize) -> Image {
            let rect = CGRect(origin: CGPointZero, size: size)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            let context = UIGraphicsGetCurrentContext();
            colour.setFill()
            CGContextFillRect(context, rect);
            let image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return image;
        }
    
    }
    
#endif

extension Image {
    public class func imageWithColour(colour:Colour) -> Image {
        return imageWithColour(colour, size: CGSizeMake(1, 1))
    }
}
