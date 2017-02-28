//
//  HttpRequest.swift
//  SMS
//
//  Created by SSd on 2/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation

class HttpRequest {
    let config : URLSessionConfiguration?
    let session : URLSession?
    // get default config if confi is nil
    init(config : URLSessionConfiguration?) {
        if let config = config {
            self.config = config
            self.session = URLSession(configuration: config)
        }else{
            self.config = URLSessionConfiguration.default
            self.session = URLSession(configuration: URLSessionConfiguration.default)
        }
    }
    
    public func getRequest(stringUrl : String,completion : @escaping(HttpJsonDataResponse?) -> Void){
        let url = URL(string: stringUrl)
        let task = self.session?.dataTask(with: url!){
            (data,urlResponse,error) in
            var httpJsonDataResponse = HttpJsonDataResponse()
            if let error = error{
                httpJsonDataResponse.isSucess = false
                httpJsonDataResponse.errorMessage = error.localizedDescription
                completion(httpJsonDataResponse)
                return
            }
            if let headerResponse = urlResponse{
                let headerResponse =  headerResponse as! HTTPURLResponse
                httpJsonDataResponse.statusCode = headerResponse.statusCode
                // try parse data to json
                if let data = data {
                    do{
                        httpJsonDataResponse.json = try JSONSerialization.jsonObject(with: data, options: [])
                    }catch{
                        httpJsonDataResponse.json = nil
                    }
                }
                if(headerResponse.statusCode == 200){
                    httpJsonDataResponse.isSucess = true
                }
                completion(httpJsonDataResponse)
            }else{
                httpJsonDataResponse.isSucess = false
                httpJsonDataResponse.statusCode = -1000
                httpJsonDataResponse.errorMessage = ErrorMessage.UNKNOWERROR.rawValue
                completion(httpJsonDataResponse)
            }
            
            
        }
        task?.resume()
    }
}
