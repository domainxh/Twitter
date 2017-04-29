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

extension Collection where Iterator.Element == JSON {
    // By putting the <T>, you're specifying that if your input is of type T, your return will be of type T so you eliminate the needs to write self.users = usersJsonArray.decode() as! [User]
//    func decdoe() -> [] {
    
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{try T(json: $0)}
    }
}

class HomeDataSource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        guard let usersJsonArray = json["users"].array, let tweetJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "'users' or 'tweets' not available in json"])
        }
        
//        self.users = usersJsonArray.map{ User(json: $0) }
//        self.tweets = tweetJsonArray.map{ Tweet(json: $0) }
        
        self.users = try usersJsonArray.decode()
        self.tweets = try tweetJsonArray.decode()
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 { return tweets[indexPath.item] }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 { return tweets.count }
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
    
    override func numberOfSections() -> Int {
        return 2
    }
}
