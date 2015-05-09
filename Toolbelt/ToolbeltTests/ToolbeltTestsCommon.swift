//
//  ToolbeltTestsCommon.swift
//  Toolbelt
//
//  The MIT License (MIT)
//
//  Copyright (c) 09/05/2015 Alexander G Edge
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

import XCTest
import CoreGraphics

class ToolbeltTestsCommon: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmailValidation () {
        
        let email = "alex@alexedge.co.uk"
        XCTAssert(email.isValidEmail(), "email is valid")
        
    }
    
    func testPhoneNumberValidation () {
        
        let number = "01202252409"
        XCTAssert(number.isValidPhoneNumber(), "phone number is valid")
        
    }
    
    func testImageGeneration () {
        let image = Image.imageWithColour(Colour.redColor(), size: CGSizeMake(50, 50))
        XCTAssertNotNil(image, "image shouldn't be nil")
    }

    
}

