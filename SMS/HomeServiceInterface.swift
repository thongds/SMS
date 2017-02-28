//
//  HomeServiceInterface.swift
//  SMS
//
//  Created by SSd on 2/25/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeServiceInterface {
    
    func getHomeApi(callBack : @escaping (HttpJsonDataResponse) -> Void)
    func getHomeEventApi(callBack : @escaping (HttpJsonDataResponse) -> Void)
    
}
