//
//  RepController.swift
//  FindMyRep
//
//  Created by Eva Marie Bresciano on 6/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import Foundation

class RepController {
    
    static let sharedInstance = RepController()
    
    static let baseURLString =  "http://whoismyrepresentative.com/getall_reps_bystate.php"
    
//    static func searchURLByState(state: String) -> NSURL {
//        return NSURL(string: baseURLString + "/getall_reps_bystate.php?state=\(state)&output=json")!
//    }
    
    static func searchRepsByState(state: String, completion: (reps : [Rep]) -> Void) {
        
        guard let url = NSURL(string: baseURLString) else {
            completion(reps: [])
            return
        }
        
        let urlParameters = ["state":"\(state)", "output": "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            guard let data = data,
                let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String:AnyObject]),
                let repDictionaries = jsonDictionary?["results"] as? [[String: AnyObject]] else {
                    
                    print("could not serialize json")
                    completion(reps: [])
                    return
                }
            
            let reps = repDictionaries.flatMap({Rep(jsonDictionary:$0)})
            completion(reps: reps)
        }
        
    }
    
}


