//
//  MessageToView.swift
//  SMS
//
//  Created by SSd on 2/28/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation

struct MessageToView {
    var message : String?
    var isSucess : Bool = true
    var data : Any?
}
enum MessageEncode : String {
    case PareJsonError = "can not parse json from server"
}
