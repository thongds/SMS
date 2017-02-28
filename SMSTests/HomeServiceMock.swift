//
//  HomeServiceMock.swift
//  SMS
//
//  Created by SSd on 2/28/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
@testable import SMS


class HomeServiceMock : HomeServiceInterface {
    
    let json = "{\r\n  \"Rock\": [\r\n    {\r\n      \"name\": \"Rock2345\",\r\n      \"duration\": \"4:20\",\r\n      \"avatar\": \"http://localhost/SMS/public/uploads/1487591498_random_86phpO6TUYe.jpg\",\r\n      \"subtitle_source\": \"http://localhost/SMS/public/uploads/1486904883_random_62phpyWL1GV.jpg\",\r\n      \"category_id\": 1,\r\n      \"language_id\": 1,\r\n      \"singer_id\": 1,\r\n      \"subtitle_type_id\": 1,\r\n      \"song_type_id\": 1,\r\n      \"song_detail_id\": 23,\r\n      \"song_source\": \"http://localhost/SMS/public/uploads/1486904883_random_54phpjPGJas.jpg\",\r\n      \"singer\": \"Taylo swift\"\r\n    },\r\n    {\r\n      \"name\": \"adminas\",\r\n      \"duration\": \"4:20\",\r\n      \"avatar\": \"http://localhost/SMS/public/uploads/1486951305_random_33phpRUQIFj.jpg\",\r\n      \"subtitle_source\": \"http://localhost/SMS/public/uploads/1486951305_random_18phpu5SYBO.jpg\",\r\n      \"category_id\": 1,\r\n      \"language_id\": 1,\r\n      \"singer_id\": 1,\r\n      \"subtitle_type_id\": 1,\r\n      \"song_type_id\": 1,\r\n      \"song_detail_id\": 24,\r\n      \"song_source\": \"http://localhost/SMS/public/uploads/1486951305_random_79phpHR6KJu.jpg\",\r\n      \"singer\": \"Taylo swift\"\r\n    }\r\n  ],\r\n  \"Pop\": [\r\n    {\r\n      \"name\": \"Pop new song\",\r\n      \"duration\": \"4:20\",\r\n      \"avatar\": \"http://localhost/SMS/public/uploads/1487729321_random_36phpkoZ9gu.jpg\",\r\n      \"subtitle_source\": \"http://localhost/SMS/public/uploads/1487729321_random_66phpbKfo4H.jpg\",\r\n      \"category_id\": 2,\r\n      \"language_id\": 1,\r\n      \"singer_id\": 1,\r\n      \"subtitle_type_id\": 1,\r\n      \"song_type_id\": 1,\r\n      \"song_detail_id\": 29,\r\n      \"song_source\": \"http://localhost/SMS/public/uploads/1487729321_random_71phpTMxogD.jpg\",\r\n      \"singer\": \"Taylo swift\"\r\n    }\r\n  ]\r\n}"
    
    let jsonTest = "{\"Rock\" : \"rock123\"}"
    //let jsonResponse =
    func getHomeApi(callBack : @escaping (HttpJsonDataResponse) -> Void){
        var httpJsonDataResponse = HttpJsonDataResponse()
        let data = json
        httpJsonDataResponse.json = jsonTest.data(using: .utf8)
        httpJsonDataResponse.isSucess = true
        httpJsonDataResponse.statusCode = 200
        callBack(httpJsonDataResponse)
    }
    func getHomeEventApi(callBack : @escaping (HttpJsonDataResponse) -> Void){
    
    }
}
