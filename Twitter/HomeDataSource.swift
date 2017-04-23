//
//  HomeDataSource.swift
//  Twitter
//
//  Created by Xiaoheng Pan on 4/12/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        let usersJsonArray = json["users"].array
        let tweetJsonArray = json["tweets"].array
        
        self.users = usersJsonArray!.map{ User(json: $0) }
        self.tweets = tweetJsonArray!.map{ Tweet(json: $0) }
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if  indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
}
