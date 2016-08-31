//
//  DateTests.swift
//  Toolbelt
//
//  Created by Alexander Edge on 04/09/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import XCTest
@testable import Toolbelt

class DateTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testDateLessThanDate() {
        
        let date1 = Date()
        let date2 = date1.addingTimeInterval(1)
        
        XCTAssert(date1 < date2)
        XCTAssert(date1 <= date2)
        XCTAssertFalse(date1 == date2)
        XCTAssertFalse(date1 > date2)
    }
    
    func testDateEqualToDate() {
        let date1 = Date(timeIntervalSinceReferenceDate: 500)
        let date2 = Date(timeIntervalSinceReferenceDate: 500)
        
        XCTAssertFalse(date1 < date2)
        XCTAssertTrue(date1 == date2)
        XCTAssertFalse(date1 > date2)
        
    }
    
    func testDateGreaterThanDate() {
        let date1 = Date()
        let date2 = date1.addingTimeInterval(-1)
        
        XCTAssert(date1 > date2)
        XCTAssert(date1 >= date2)
        XCTAssertFalse(date1 == date2)
        XCTAssertFalse(date1 < date2)
    }

    
}
