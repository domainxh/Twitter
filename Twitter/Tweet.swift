//
//  Tweet.swift
//  Twitter
//
//  Created by Xiaoheng Pan on 4/18/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["name"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
