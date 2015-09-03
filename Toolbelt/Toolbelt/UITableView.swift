//
//  UITableView.swift
//  Toolbelt
//
//  Created by Alexander Edge on 03/09/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import UIKit

extension UITableView {
    
    public var lastIndexPath : NSIndexPath {
        let lastSection = self.lastSection
        return NSIndexPath(forRow: self.lastRowInSection(lastSection), inSection: lastSection)
    }
    
    public func lastRowInSection(section : Int) -> Int {
        return self.numberOfRowsInSection(section) - 1
    }
    
    public var lastSection : Int {
        return self.numberOfSections - 1
    }
    
}