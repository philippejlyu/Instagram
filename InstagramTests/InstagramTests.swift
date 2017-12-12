//
//  InstagramTests.swift
//  InstagramTests
//
//  Created by Philippe Yu on 2017-12-12.
//  Copyright © 2017 Philippe Yu. All rights reserved.
//

import XCTest
@testable import Instagram

class InstagramTests: XCTestCase {
    
    var dataManagerUnderTest: DataManager!
    
    override func setUp() {
        super.setUp()
        dataManagerUnderTest = DataManager()
        
    }
    
    override func tearDown() {
        dataManagerUnderTest = nil
        
        super.tearDown()
    }
    
    func testJSONParsing() {
        let url = Bundle.main.url(forResource: "images", withExtension: "json")!
        let jsonArray = dataManagerUnderTest.getJSONString(url)
        let result = jsonArray[jsonArray.count-1] //Get the last object in the array
        XCTAssert(result.username == "Smithers")
        XCTAssert(result.caption == "I like the way Snrub thinks")
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
