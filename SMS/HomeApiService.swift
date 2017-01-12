//
//  HomeApiService.swift
//  SMS
//
//  Created by SSd on 1/11/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation

class HomeApiService{
    
    func getHomeData(_ callBack : @escaping([HomeResponse]) -> Void){
        let indicator = IndicatorResponse(linkImage: "https://abc.com", name: "tayloswift")
        let homeRespnse = ["mainSlide" : ["https://image.com","https://image.com"],"indicator" : [indicator]]
        
    }
    
}
