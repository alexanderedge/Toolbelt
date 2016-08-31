//
//  AVCaptureDevice+Authorisation.swift
//  Company
//
//  Created by Alexander G Edge on 21/07/2015.
//  Copyright (c) 2015 Company. All rights reserved.
//

import AVFoundation

extension AVCaptureDevice {
    
    public class func requestAuthorisationForVideoCamera(_ completion : ((Bool) -> Void)?) {
        self.requestAuthorisationForMediaType(AVMediaTypeVideo, completion: completion)
    }
    
    public class func requestAuthorisationForMicrophone(_ completion : ((Bool) -> Void)?) {
        self.requestAuthorisationForMediaType(AVMediaTypeAudio, completion: completion)
    }
     
    public class func requestAuthorisationForMediaType(_ type : String, completion : ((Bool) -> Void)?) {
        let status = AVCaptureDevice.authorizationStatus(forMediaType: type)
        switch status {
        case .notDetermined:
            AVCaptureDevice.requestAccess(forMediaType: type) { granted in
                DispatchQueue.main.async {
                    completion?(granted)
                }
            }
            break;
        case .restricted, .denied:
                completion?(false);
            break;
        case .authorized:
                completion?(true);
            break;
        }
    }
}
