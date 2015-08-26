//
//  AVCaptureDevice+Authorisation.swift
//  Company
//
//  Created by Alexander G Edge on 21/07/2015.
//  Copyright (c) 2015 Company. All rights reserved.
//

import AVFoundation

extension AVCaptureDevice {
    
    public class func checkAuthorisationStatusForVideoCamera(completion : ((Bool) -> Void)?) {
        self.checkAuthorisationStatusForMediaType(AVMediaTypeVideo, completion: completion)
    }
    
    public class func checkAuthorisationStatusForMicrophone(completion : ((Bool) -> Void)?) {
        self.checkAuthorisationStatusForMediaType(AVMediaTypeAudio, completion: completion)
    }
    
    public class func checkAuthorisationStatusForMediaType(type : String, completion : ((Bool) -> Void)?) {
        let status = AVCaptureDevice.authorizationStatusForMediaType(type)
        
        switch status {
        case .NotDetermined:
                AVCaptureDevice.requestAccessForMediaType(type, completionHandler: { (granted : Bool) -> Void in
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                       completion?(granted)
                    })
                })
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
