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


