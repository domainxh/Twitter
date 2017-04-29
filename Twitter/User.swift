//
//  User.swift
//  Twitter
//
//  Created by Xiaoheng Pan on 4/15/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable {
    let name: String
    let username: String
    let bio: String
    let profileImageUrl: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bio = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
