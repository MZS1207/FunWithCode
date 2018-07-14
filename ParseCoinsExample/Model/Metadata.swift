//
//  Metadata.swift
//  ParseCoinsExample
//
//  Created by Milos Stevanovic on 7/14/18.
//  Copyright © 2018 Milos Stevanovic. All rights reserved.
//
import Foundation
struct Metadata{
    var error : String!
    var numCryptocurrencies : Int!
    var timestamp : Int!
    
    init(dictionary: [String: Any]) {
        self.error = dictionary["error"] as? String ?? nil
        self.numCryptocurrencies = dictionary["numCryptocurrencies"] as? Int ?? nil
        self.timestamp = dictionary["timestamp"] as? Int ?? nil
    }
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if error != nil{
            dictionary["error"] = error
        }
        if numCryptocurrencies != nil{
            dictionary["numCryptocurrencies"] = numCryptocurrencies
        }
        if timestamp != nil{
            dictionary["timestamp"] = timestamp
        }
        return dictionary
    }
}
