//
//  HttpRequestTest.swift
//  SMS
//
//  Created by SSd on 2/28/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import XCTest
@testable import SMS

class HttpRequestTest: XCTestCase {
    
    var request : HttpRequest?
    
    override func setUp() {
        super.setUp()
        let config  = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        request = HttpRequest(config : config)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRequestCheckStatusSuccess() {
        
        //when
        
        let expectation = self.expectation(description: "expectation load data asyc")
        let url = Domain.domain.rawValue+ApiUrl.homeUrl.rawValue
        
        //do
        
        request?.getRequest(stringUrl : url){
            (data) in
            expectation.fulfill()
            //expect
            
            XCTAssertEqual(200, data!.statusCode)
            XCTAssertTrue(data!.isSucess)
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testRequestCheckStatusFail() {
        
        //when
        
        let expectation = self.expectation(description: "expectation load data asyc")
        let url = Domain.domain.rawValue+ApiUrl.homeUrl.rawValue + "error"
        
        //do
        
        request?.getRequest(stringUrl : url){
            (data) in
            expectation.fulfill()
            //expect
            
            XCTAssertEqual(404, data!.statusCode)
            XCTAssertFalse(data!.isSucess)
        }
        
        waitForExpectations(timeout: 3, handler: nil)
        
    }
    
    func testRequestCheckTimeOutRequest() {
        
        //when
        
        let expectation = self.expectation(description: "expectation load data asyc")
        let url = Domain.domain.rawValue+ApiUrl.timeOutUrl.rawValue
        
        //do
        
        request?.getRequest(stringUrl : url){
            (data) in
            expectation.fulfill()
            //expect
            XCTAssertFalse(data!.isSucess)
            XCTAssertEqual("The request timed out.", data!.errorMessage)
            
        }
        
        waitForExpectations(timeout: 20, handler: nil)
        
    }
    
    func testRequestCheckResponseNotNil() {
        
        //when
        
        let expectation = self.expectation(description: "expectation load data asyc")
        let url = Domain.domain.rawValue+ApiUrl.homeUrl.rawValue
        
        //do
        
        request?.getRequest(stringUrl : url){
            (data) in
            expectation.fulfill()
            
            //expect
            
            XCTAssertEqual(200, data!.statusCode)
            XCTAssertTrue(data!.isSucess)
            XCTAssertNotNil(data!.json)
        }
        waitForExpectations(timeout: 3, handler: nil)
        
    }
    func testRequestCheckResponseNotJson() {
        
        //when
        
        let expectation = self.expectation(description: "expectation load data asyc")
        let url = Domain.domain.rawValue+ApiUrl.responseNotJson.rawValue
        
        //do
        
        request?.getRequest(stringUrl : url){
            (data) in
            expectation.fulfill()
            
            //expect
            
            XCTAssertEqual(200, data!.statusCode)
            XCTAssertTrue(data!.isSucess)
            XCTAssertNil(data!.json)
        }
        waitForExpectations(timeout: 3, handler: nil)
        
    }

}
