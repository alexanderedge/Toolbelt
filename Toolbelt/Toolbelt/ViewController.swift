//
//  ViewController.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 02/05/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController {
    public func removeBackButtonTitle() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
}

