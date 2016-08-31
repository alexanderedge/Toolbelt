//
//  UITableView.swift
//  Toolbelt
//
//  Created by Alexander Edge on 03/09/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import UIKit

extension UITableView {
    
    public var lastIndexPath : IndexPath {
        let lastSection = self.lastSection
        return IndexPath(row: self.lastRowInSection(lastSection), section: lastSection)
    }
    
    public func lastRowInSection(_ section : Int) -> Int {
        return self.numberOfRows(inSection: section) - 1
    }
    
    public var lastSection : Int {
        return self.numberOfSections - 1
    }
    
}
