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
        return self.cameraWithPosition(.Back)
    }
    
    public class func frontCamera() -> AVCaptureDevice? {
        return self.cameraWithPosition(.Front)
    }
    
    public class func cameraWithPosition(position : AVCaptureDevicePosition) -> AVCaptureDevice? {
        return AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo).filter({ return $0.position == position }).first as? AVCaptureDevice
    }
    
    public class func microphone() -> AVCaptureDevice? {
        return AVCaptureDevice.devicesWithMediaType(AVMediaTypeAudio).first as? AVCaptureDevice
    }
    
}