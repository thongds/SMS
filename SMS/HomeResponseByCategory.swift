//
//  HomeResponseByCategory.swift
//  SMS
//
//  Created by SSd on 2/19/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation

struct HomeResponseByCategory {
    var categoryName : String?
    var songData = [SongItem]()
    
}
extension HomeResponseByCategory {
    init?(categoryName : String?, json : [[String : Any]]) {
        self.categoryName = categoryName
        for data in json{
            let songItem = SongItem(json: data)
            if let item = songItem {
                self.songData.append(item)
            }else{
                return nil
            }
            
        }
    }
}

struct SongItem {
    
    var songName : String?
    var duration : String?
    var avatar : String?
    var subtitleSource : String?
    var categoryId : Int?
    var languageId : Int?
    var singerId : Int?
    var subtitleTypeId : Int?
    var songTypeId : Int?
    var songId : Int?
    var songSource : String?
    var singerName : String?
}
extension SongItem {
    init?(json : [String : Any]) {
        guard
            let songName = json["name"] as? String,
            let duration = json["duration"] as? String,
            let avatar = json["avatar"] as? String,
            let subtitleSource = json["subtitle_source"] as? String,
            let categoryId = json["category_id"] as? Int,
            let languageId = json["language_id"] as? Int,
            let singerId = json["singer_id"] as? Int,
            let subtitleTypeId = json["subtitle_type_id"] as? Int,
            let songTypeId = json["song_type_id"] as? Int,
            let songId = json["song_detail_id"] as? Int,
            let songSource = json["song_source"] as? String,
            let singerName = json["singer"] as? String
            else{
                return nil
        }
        self.songName = songName
        self.duration = duration
        self.avatar = avatar
        self.subtitleSource = subtitleSource
        self.categoryId = categoryId
        self.languageId = languageId
        self.singerId = singerId
        self.subtitleTypeId = subtitleTypeId
        self.songTypeId = songTypeId
        self.songId = songId
        self.songSource = songSource
        self.singerName = singerName
    }
}








