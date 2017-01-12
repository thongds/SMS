//
//  HomeModel.swift
//  SMS
//
//  Created by SSd on 1/11/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation

struct HomeResponse {
    var mMainSlide = [String]()
    var mIndicator = [IndicatorResponse]()
    var mMainResponse = [MainResponse]()
}
extension HomeResponse {
    init?(json : [String : Any]){
        guard let mainSlide = json["mainSlide"] as? [String],
        let indicator = json["indicator"] as? [[String : Any]],
        let mainResponse = json["mainResponse"] as? [[String : Any]]
        else{
            return nil
        }
        for item in mainSlide{
            self.mMainSlide.append(item)
        }
        for item in indicator {
            if let indicatorItem = IndicatorResponse(json: item){
                self.mIndicator.append(indicatorItem)
            }else{
                return nil
            }
        }
        for item in mainResponse{
            if let mainResponseItem = MainResponse(json: item){
                self.mMainResponse.append(mainResponseItem)
            }else{
                return nil
            }
        }
    }
}
struct IndicatorResponse{
    let linkImage : String?
    let imageTitle : String?
}
extension IndicatorResponse {
    init?(json :[String : Any]) {
        guard let linkImage =  json["linkImage"] as? String,
            let imageTitle = json["imageTitle"] as? String
            else{
            return nil
        }
        self.linkImage = linkImage
        self.imageTitle = imageTitle
    }
}
struct MainResponse{
    let title : String?
    let linkImage : String?
    let songName : String?
    let singerName : String?
    let songDuration : String?
}
extension MainResponse{
    init?(json : [String : Any]) {
        guard let title = json["title"] as? String,
        let linkImage = json["linkImage"] as? String,
        let songName = json["songName"] as? String,
        let singerName = json["singerName"] as? String,
        let songDuration = json["songDuration"] as? String
        else{
            return nil
        }
        self.title = title
        self.linkImage = linkImage
        self.songName = songName
        self.singerName = singerName
        self.songDuration = songDuration
    }
}























