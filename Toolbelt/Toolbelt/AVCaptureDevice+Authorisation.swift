//
//  AVCaptureDevice+Authorisation.swift
//  Company
//
//  Created by Alexander G Edge on 21/07/2015.
//  Copyright (c) 2015 Company. All rights reserved.
//

import AVFoundation

extension AVCaptureDevice {
    
    public class func requestAuthorisationForVideoCamera(completion : ((Bool) -> Void)?) {
        self.requestAuthorisationForMediaType(AVMediaTypeVideo, completion: completion)
    }
    
    public class func requestAuthorisationForMicrophone(completion : ((Bool) -> Void)?) {
        self.requestAuthorisationForMediaType(AVMediaTypeAudio, completion: completion)
    }
     
    public class func requestAuthorisationForMediaType(type : String, completion : ((Bool) -> Void)?) {
        let status = AVCaptureDevice.authorizationStatusForMediaType(type)
        switch status {
        case .NotDetermined:
            AVCaptureDevice.requestAccessForMediaType(type) { granted in
                Queue.Main.execute {
                    completion?(granted)
                }
            }
            break;
        case .Restricted, .Denied:
                completion?(false);
            break;
        case .Authorized:
                completion?(true);
            break;
        }
    }
}
