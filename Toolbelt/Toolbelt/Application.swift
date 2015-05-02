//
//  Application.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 02/05/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

import Foundation


#if os(iOS)

    import UIKit.UIApplication
    
    extension UIApplication {
        
        public func isFirstRun() -> Bool {
            let key = "uk.co.alexedge.toolbelt.first_run";
            let defaults = NSUserDefaults.standardUserDefaults()
            if (defaults.boolForKey(key)) {
                defaults.setBool(false, forKey: key)
                defaults.synchronize()
                return true
            } else {
                return false
            }
        }
        
        public func appSettingsURL() -> NSURL {
            return NSURL(string: UIApplicationOpenSettingsURLString)!
        }

        public func launchAppSettings() {
            self.openURL(appSettingsURL())
        }
    }

#endif
