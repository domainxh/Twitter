//
//  Service.swift
//  Twitter
//
//  Created by Xiaoheng Pan on 4/23/17.
//  Copyright © 2017 Xiaoheng Pan. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com/")
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource) -> ()) {
        print("Fetching home feed")
        
        let request: APIRequest<HomeDataSource, JSONError> = tron.request("twitter/home")
        request.perform(withSuccess: { (homeDataSource) in
            print("Successfuly fetch JSON")

            completion(homeDataSource)
            
        }) { (err) in
            print("Failed to fetch json: ", err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("Json Error")
        }
    }
}
