//
//  Alert.swift
//  Toolbelt
//
//  The MIT License (MIT)
//
//  Copyright (c) 02/05/2015 Alexander G Edge
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit.UIAlertController

extension UIAlertController {
    
    public func addDefaultButton(_ title : String = NSLocalizedString("OK", comment: ""), handler: ((UIAlertAction?) -> Void)?) {
        self.addAction(UIAlertAction(title: title, style: .default, handler: handler))
    }
    
    public func addCancelButton(_ title : String = NSLocalizedString("Cancel", comment: ""), handler: ((UIAlertAction?) -> Void)?) {
        self.addAction(UIAlertAction(title: title, style: .cancel, handler: handler))
    }
    
    public func addDefaultButton(_ title : String) {
        self.addDefaultButton(title, handler: nil)
    }
    
    public func addCancelButton(_ title : String) {
        self.addCancelButton(title, handler: nil)
    }
    
    public convenience init(title : String = NSLocalizedString("Error", comment: ""), error : NSError) {
        self.init(title: title, message: error.localizedDescription, preferredStyle: .alert)
    }
    
    public convenience init(title : String, message : String) {
        self.init(title: title, message: message, preferredStyle: .alert)
    }
    
}

extension UIViewController {
    
    public func showAlert(_ title : String, message : String) {
        let vc = UIAlertController(title: title, message: message)
        vc.addDefaultButton(handler: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
    public func showAlert(_ title : String, error : NSError) {
        let vc = UIAlertController(title: title, error: error)
        vc.addDefaultButton(handler: nil)
        self.present(vc, animated: true, completion: nil)
    }
    
}
