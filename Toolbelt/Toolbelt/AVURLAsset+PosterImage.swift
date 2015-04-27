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
    typealias Image = NSImage
#else
    import UIKit
    typealias Image = UIImage
#endif

extension AVURLAsset {
    
    class func posterImageFromAssetWithURL(url : NSURL!, err : NSErrorPointer) -> Image? {
        return AVURLAsset(URL: url, options: [AVURLAssetPreferPreciseDurationAndTimingKey : true]).posterImage(err)
    }
    
    func posterImage(err : NSErrorPointer) -> Image? {
        let gen = AVAssetImageGenerator(asset: self)
        gen.appliesPreferredTrackTransform = true
        gen.requestedTimeToleranceBefore = kCMTimeZero
        gen.requestedTimeToleranceAfter = kCMTimeZero
        return UIImage(CGImage: gen.copyCGImageAtTime(kCMTimeZero, actualTime: nil, error: err))
    }
    
}
