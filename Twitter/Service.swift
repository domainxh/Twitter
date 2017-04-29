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
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource?, Error?) -> ()) {
        print("Fetching home feed")
        
        let request: APIRequest<HomeDataSource, JSONError> = tron.request("twitter/home1")
        request.perform(withSuccess: { (homeDataSource) in
            completion(homeDataSource, nil)
            
        }) { (err) in
            
            let err = err as? APIError<JSONError>
            err?.response?.statusCode
            
            completion(nil, err)
        
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("Json Error")
        }
    }
}
