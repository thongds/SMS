//
//  HomePresentTest.swift
//  SMS
//
//  Created by SSd on 2/25/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import XCTest
@testable import SMS

class HomePresentTest: XCTestCase {
    
    var homePresent : HomePresent!
    var mockData : HomeServiceMock!
    override func setUp() {
        super.setUp()
        mockData = HomeServiceMock()
        homePresent = HomePresent()
    }
    
    func testHomeResponse(){
        homePresent.homeService = HomeApiService()
        let expectation = self.expectation(description: "expectation load data asyc")
        homePresent.getHomeData(){
            (message) in
                expectation.fulfill()
                XCTAssertTrue(message.isSucess)
                XCTAssertEqual(4,self.homePresent.homeData.count)
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    
    override func tearDown() {
     
        super.tearDown()
    }
    
    
}
