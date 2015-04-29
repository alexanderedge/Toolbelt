//
//  AVURLAsset+PosterImage.swift
//  Peeps
//
//  Created by Alexander G Edge on 27/04/2015.
//  Copyright (c) 2015 Peeps Media Ltd. All rights reserved.
//

import AVFoundation

#if os(OSX)
    import AppKit
    public typealias TKImage = NSImage
#else
    import UIKit
    public typealias TKImage = UIImage
#endif

extension AVURLAsset {
    
    public class func posterImageFromAssetWithURL(url : NSURL!, err : NSErrorPointer) -> UIImage? {
        return AVURLAsset(URL: url, options: [AVURLAssetPreferPreciseDurationAndTimingKey : true]).posterImage(err)
    }
    
    public func posterImage(err : NSErrorPointer) -> TKImage? {
        let gen = AVAssetImageGenerator(asset: self)
        gen.appliesPreferredTrackTransform = true
        gen.requestedTimeToleranceBefore = kCMTimeZero
        gen.requestedTimeToleranceAfter = kCMTimeZero
        #if os(OSX)
            return TKImage(CGImage: gen.copyCGImageAtTime(kCMTimeZero, actualTime: nil, error: err), size: NSZeroSize)
            #else
            return TKImage(CGImage: gen.copyCGImageAtTime(kCMTimeZero, actualTime: nil, error: err))
        #endif
    }
    
}
