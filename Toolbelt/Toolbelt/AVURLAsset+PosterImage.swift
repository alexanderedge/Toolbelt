//
//  AVURLAsset+PosterImage.swift
//  Peeps
//
//  Created by Alexander G Edge on 27/04/2015.
//  Copyright (c) 2015 Peeps Media Ltd. All rights reserved.
//

import AVFoundation
import UIKit

extension AVURLAsset {
    
    public class func posterImageFromAssetWithURL(url : NSURL!, err : NSErrorPointer) -> UIImage? {
        return AVURLAsset(URL: url, options: [AVURLAssetPreferPreciseDurationAndTimingKey : true]).posterImage(err)
    }
    
    public func posterImage(err : NSErrorPointer) -> UIImage? {
        let gen = AVAssetImageGenerator(asset: self)
        gen.appliesPreferredTrackTransform = true
        gen.requestedTimeToleranceBefore = kCMTimeZero
        gen.requestedTimeToleranceAfter = kCMTimeZero
        return UIImage(CGImage: gen.copyCGImageAtTime(kCMTimeZero, actualTime: nil, error: err))
    }
    
}
