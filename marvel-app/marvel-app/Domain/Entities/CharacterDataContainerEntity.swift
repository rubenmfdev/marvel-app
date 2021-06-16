//
//  CharacterDataContainer.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class CharacterDataContainerEntity: NSObject, Mappable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [CharacterEntity]?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        offset                  <- map["offset"]
        limit                   <- map["limit"]
        total                   <- map["total"]
        count                   <- map["count"]
        results                 <- map["results"]

    }
}
