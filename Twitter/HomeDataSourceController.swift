//
//  HomeDataSourceController.swift
//  Twitter
//
//  Created by Xiaoheng Pan on 4/12/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController {
    
    let tron = TRON(baseURL: "http://api.letsbuildthatapp.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
//        let homeDataSource = HomeDataSource()
//        self.datasource = homeDataSource
        
        fetchHomeFeed()

    }
    
    class Home: JSONDecodable {
        
        let users: [User]
        
        required init(json: JSON) throws {
            print("now ready to parse json: \n", json)
            
            var users = [User]()
            let array = json["users"].array
            
            for userJson in array! {
                let name = userJson["name"].stringValue
                let username = userJson["username"].stringValue
                let bioText = userJson["bio"].stringValue
                
                let user = User(name: name, username: username, bioText: bioText, profileImage: UIImage())
                users.append(user)
            }
            
            self.users = users
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("Json Error")
        }
    }
    
    fileprivate func fetchHomeFeed() {
        // This is alot of code to do it without TRON
        // URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
        let request: APIRequest<HomeDataSource, JSONError> = tron.request("twitter/home")
        request.perform(withSuccess: { (homeDataSource) in
            print("Successfuly fetch JSON")
            self.datasource = homeDataSource
        }) { (err) in
            print("Failed to fetch json: ", err)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {

            // get estimation for height of cell based off bioText content.
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attribute = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
}
