//
//  Converter.swift
//  ParseCoinsExample
//
//  Created by Milos Stevanovic on 14/7/18.
//  Copyright © 2018 Milos Stevanovic. All rights reserved.
//

import Foundation

struct Converter {
    var data : [DataStruct]!
    var metadata : Metadata!
    
    init(fromDictionary dictionary: [String:Any]){
        if let metadataData = dictionary["metadata"] as? [String:Any]{
            metadata = Metadata(dictionary: metadataData)
        }
        data = [DataStruct]()
        if let dataArray = dictionary["data"] as? [[String:Any]]{
            for dic in dataArray{
                let value = DataStruct(dictionary: dic)
                data.append(value)
            }
        }
        
        func toDictionary() -> [String:Any]
        {
            var dictionary = [String:Any]()
            if metadata != nil{
                dictionary["metadata"] = metadata.toDictionary()
            }
            if data != nil{
                var dictionaryElements = [[String:Any]]()
                for payloadElement in data {
                    dictionaryElements.append(payloadElement.toDictionary())
                }
                dictionary["data"] = dictionaryElements
            }
            return dictionary
        }
    }
}

extension Converter : Parceable {
    
    
    static func parseObject(dictionary: [String : AnyObject]) -> Result<Converter, ErrorResult> {
        if  dictionary["data"] != nil,dictionary["metadata"] != nil {
            
            let conversion = Converter(fromDictionary: dictionary)
            print(conversion.data.count)
            print(conversion.metadata)
            
            return Result.success(conversion)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))
        }
    }
}
