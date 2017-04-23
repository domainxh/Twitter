//
//  User.swift
//  Twitter
//
//  Created by Xiaoheng Pan on 4/15/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let name: String
    let username: String
    let bio: String
    let profileImage: UIImage
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bio = json["bio"].stringValue
        let profileImageURL = URL(string: json["profileImageUrl"].stringValue)
//        if let data = NSData(contentsOf: profileImageURL!) {
//            self.profileImage = UIImage(data: data as Data)!
//        } else {
            self.profileImage = UIImage()
//        }

    }
}
