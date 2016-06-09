//
//  Rep.swift
//  FindMyRep
//
//  Created by Eva Marie Bresciano on 6/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import Foundation

class Rep {
    
    private let kName = "name"
    private let kParty = "party"
    private let kState = "state"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    
    init?(jsonDictionary: [String:AnyObject]) {
        guard let name = jsonDictionary[kName] as? String,
        party = jsonDictionary[kParty] as? String,
        state = jsonDictionary[kState] as? String,
        district = jsonDictionary[kDistrict] as? String,
        phone = jsonDictionary[kPhone] as? String,
        office = jsonDictionary[kParty] as? String else {
            return nil
        }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office 
        
        
    }
    
}
