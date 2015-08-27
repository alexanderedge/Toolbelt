//
//  Image.swift
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

#if os(OSX)
    import AppKit.NSImage
    public typealias Image = NSImage
    
    extension Image {
        
        public convenience init(CGImage cgImage: CGImage) {
            self.init(CGImage : cgImage, size: CGSizeZero);
        }
    
        public class func imageWithColour(colour: Colour, size: CGSize) -> Image {
            let width = Int(size.width)
            let height = Int(size.height)
            let bitsPerComponent = 8
            let bytesPerRow = 4 * width
            let colourSpace = CGColorSpaceCreateDeviceRGB()
            let ctx = CGBitmapContextCreate(nil, width, height, bitsPerComponent, bytesPerRow, colourSpace, CGImageAlphaInfo.PremultipliedLast.rawValue)
            CGContextSetFillColorWithColor(ctx, colour.CGColor)
            CGContextFillRect(ctx,CGRect(origin: CGPointZero,size: size));
            return Image(CGImage:CGBitmapContextCreateImage(ctx)!)
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
    
    
    #if os(iOS)
    public func resizedImage(size : CGSize, contentMode : UIViewContentMode = .ScaleAspectFill) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        // currently only scale to fill
        
        var rect = CGRect(origin: CGPointZero, size: size)
        
        switch contentMode {
        case .ScaleAspectFill:
            //rect = CGRect(origin: CGPointZero, size: size)
            
            let aspectRatio = self.size.width / self.size.height
            
            let newAspectRatio = size.width / size.height
            
            if fabs(aspectRatio - newAspectRatio) < CGFloat(FLT_EPSILON) {
                // ratios are the same
                break
            }
            
            if newAspectRatio > aspectRatio {
                // wider
                let newHeight = size.width / aspectRatio
                rect = CGRectInset(rect, 0, (size.height - newHeight) / 2)
                
            } else {
                // new bounds is taller
                let newWidth = size.height * aspectRatio
                rect = CGRectInset(rect, (size.width - newWidth) / 2, 0)
            }
            
            break
        case .ScaleAspectFit:
            
            // not implemented yet
            
            rect = CGRect(origin: CGPointZero, size: size)
            break
        default:
            break
        }
        
        self.drawInRect(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    public func resizedImage(scale : CGFloat) -> UIImage {
        return self.resizedImage(self.size.scaleBy(scale))
    }
    #endif
}
