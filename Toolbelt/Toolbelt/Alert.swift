//
//  Alert.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 02/05/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

#if os(iOS)
    
    import UIKit.UIAlertController
    
    extension UIAlertController {
        
        public func addCancelButtonWithHandler(handler: ((UIAlertAction!) -> Void)?) {
            self.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancels the current alert"), style: .Cancel, handler: handler))
        }
        
        public func addCancelButton() {
            self.addCancelButtonWithHandler(nil)
        }
        
        public class func alertControllerForErrorWithTitle(title:String, error : NSError) -> UIAlertController {
            let vc = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .Alert)
            vc.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"), style: .Default, handler: nil))
            return vc
        }
        
    }
    
#endif


