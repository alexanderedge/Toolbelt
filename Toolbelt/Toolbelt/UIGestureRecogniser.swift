//
//  UIGestureRecogniser.swift
//  Toolbelt
//
//  Created by Alexander Edge on 28/08/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import UIKit.UIGestureRecognizer

extension UIGestureRecognizer {
    
    public func cancel() {
        self.enabled = false
        self.enabled = true
    }
    
}