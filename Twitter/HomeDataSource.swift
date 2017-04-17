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
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
}
