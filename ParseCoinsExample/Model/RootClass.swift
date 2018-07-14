//
//  Root.swift
//  ParseCoinsExample
//
//  Created by Milos Stevanovic on 7/14/18.
//  Copyright © 2018 Milos Stevanovic. All rights reserved.
//

import Foundation


struct RootClass{
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
    }
}


