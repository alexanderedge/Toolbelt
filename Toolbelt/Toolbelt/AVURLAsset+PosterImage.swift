//
//  AVURLAsset+PosterImage.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 27/04/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

import AVFoundation

extension AVURLAsset {
    
    public class func posterImageFromAssetWithURL(url : NSURL!, err : NSErrorPointer) -> Image? {
        return AVURLAsset(URL: url, options: [AVURLAssetPreferPreciseDurationAndTimingKey : true]).posterImage(err)
    }
    
    public func posterImage(err : NSErrorPointer) -> Image? {
        let gen = AVAssetImageGenerator(asset: self)
        gen.appliesPreferredTrackTransform = true
        gen.requestedTimeToleranceBefore = kCMTimeZero
        gen.requestedTimeToleranceAfter = kCMTimeZero
        return Image(CGImage: gen.copyCGImageAtTime(kCMTimeZero, actualTime: nil, error: err))
    }
    
}
