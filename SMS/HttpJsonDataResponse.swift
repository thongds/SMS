//
//  HttpDataResponse.swift
//  SMS
//
//  Created by SSd on 2/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation

struct HttpJsonDataResponse {
    var isSucess : Bool = false
    var statusCode : Int = 404
    var errorMessage : String = ""
    var json : Any? = nil
    
}

enum status {
    case isSucess
    case isFailt
}
