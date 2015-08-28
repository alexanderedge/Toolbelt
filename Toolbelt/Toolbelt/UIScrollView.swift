//
//  UIScrollView.swift
//  Toolbelt
//
//  Created by Alexander Edge on 27/08/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    public var page : Int {
        return Int(self.contentOffset.x / CGRectGetWidth(self.bounds))
    }
    
}
