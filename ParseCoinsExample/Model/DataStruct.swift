//
//  DataStruct.swift
//  ParseCoinsExample
//
//  Created by Milos Stevanovic on 7/14/18.
//  Copyright © 2018 Milos Stevanovic. All rights reserved.
//

import Foundation
struct DataStruct{
    var id : Int!
    var name : String!
    var symbol : String!
    var websiteSlug : String!
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? Int ?? nil
        self.name = dictionary["name"] as? String ?? nil
        self.symbol = dictionary["symbol"] as? String ?? nil
        self.websiteSlug = dictionary["websiteSlug"] as? String ?? nil
        
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if symbol != nil{
            dictionary["symbol"] = symbol
        }
        if websiteSlug != nil{
            dictionary["websiteSlug"] = websiteSlug
        }
        return dictionary
    }
    
    
    
}
