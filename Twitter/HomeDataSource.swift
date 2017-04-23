//
//  HomeDataSource.swift
//  Twitter
//
//  Created by Xiaoheng Pan on 4/12/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let brianUser = User(name: "Brian", username: "@letsbuildthatapp", bioText: "Some more bio text", profileImage: #imageLiteral(resourceName: "profile"))
        let rayUser = User(name: "Ray", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "profile2"))
        let kindleCoursePromotion = User(name: "Kindle Course", username: "@kindlecourse", bioText: "This is a long message trying to figure out if the view will display correctly when the biotext is really long. I thoroughly enjoylasjdf;laijsd;ijfa;lks ijf;kdifj aksf;ijas;df lajsdli ja;sdjf ;lasjf ;lasjdf;ija s;dlkjf;a lsdjfli jas;ldfj ;aldsjf idjjasd;lkfja  a;lkdjf;lasjdfjasjf  ;alkdfj ;aslkdjfj faksdj faldjf asdfj aksdfj a;sldkfj akds ksjfkajd", profileImage: #imageLiteral(resourceName: "profile"))
        
        return [brianUser, rayUser, kindleCoursePromotion]
    }()
    
    let tweets: [Tweet] = {
        let brianUser = User(name: "Brian", username: "@letsbuildthatapp", bioText: "Some more bio text", profileImage: #imageLiteral(resourceName: "profile"))
        let rayUser = User(name: "Ray", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "profile2"))
        
        let tweet = Tweet(user: brianUser, message: "welcome to episode 9 of twiter series, really hope you can learn alot and enjoy my teaching style. I apprecite you what else am i going to write what the fuck. tomorrow i'm going to wake and be a better and smarter person.")
        let tweet2 = Tweet(user: rayUser, message: "Google is an American multinational technology company specializing in Internet-related services and products. These include online advertising technologies, search, cloud computing, software, and hardware. Google was founded in 1996 by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University, in California. Together, they own about 14 percent of its shares, and control 56 percent of the stockholder voting power through supervoting stock. They incorporated Google as a privately held company on September 4, 1998. An initial public offering (IPO) took place on August 19, 2004, and Google moved to its new headquarters in Mountain View, California, nicknamed the Googleplex. ")
        
        return [tweet, tweet2]
    }()
    
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
