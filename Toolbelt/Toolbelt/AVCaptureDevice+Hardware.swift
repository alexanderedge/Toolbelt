//
//  AVCaptureDevice+Hardware.swift
//  Company
//
//  Created by Alexander G Edge on 21/07/2015.
//  Copyright (c) 2015 Company. All rights reserved.
//

import AVFoundation

extension AVCaptureDevice {
    
    public class func hasFrontAndBackCamera() -> Bool {
        return (self.backCamera() != nil) && (self.frontCamera() != nil)
    }
    
    public class func backCamera() -> AVCaptureDevice? {
        return self.cameraWithPosition(.back)
    }
    
    public class func frontCamera() -> AVCaptureDevice? {
        return self.cameraWithPosition(.front)
    }
    
    public class func cameraWithPosition(_ position : AVCaptureDevicePosition) -> AVCaptureDevice? {
        guard let devices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) as? [AVCaptureDevice] else { return nil }
        return devices.filter({ $0.position == position }).first
    }
    
    public class func microphone() -> AVCaptureDevice? {
        return AVCaptureDevice.devices(withMediaType: AVMediaTypeAudio).first as? AVCaptureDevice
    }
    
}
