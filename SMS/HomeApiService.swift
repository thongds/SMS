//
//  HomeApiService.swift
//  SMS
//
//  Created by SSd on 1/11/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import Alamofire

class HomeApiService : HomeServiceInterface{
    
    let httpRequest = HttpRequest(config: nil)
    
    func getHomeApi(callBack : @escaping (HttpJsonDataResponse) -> Void){
        
        httpRequest.getRequest(stringUrl: Domain.domain.rawValue + ApiUrl.homeUrl.rawValue){
            (data) in
                callBack(data!)
        }
    }
    func getHomeEventApi(callBack: @escaping (HttpJsonDataResponse) -> Void) {
        httpRequest.getRequest(stringUrl: Domain.domain.rawValue + ApiUrl.eventUrl.rawValue){
            (data) in
            callBack(data!)
        }
    }
}
