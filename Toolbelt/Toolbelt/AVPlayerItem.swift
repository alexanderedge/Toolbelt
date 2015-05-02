//
//  AVPlayerItem.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 02/05/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

import AVFoundation

extension AVPlayerItem {
    
    public class func playerItemWithData(data : NSData) -> AVPlayerItem? {
        let tempURL = NSURL.temporaryFileURL()
        if data.writeToURL(tempURL, atomically: false) {
            return self(URL: tempURL)
        } else {
            return nil
        }
    }
    
}