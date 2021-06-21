//
//  Url.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class UrlDTO: NSObject, Mappable {
    var type: String?
    var url: String?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        type                        <- map["type"]
        url                         <- map["url"]
    }
}

extension UrlDTO {
    public func toDomain() -> UrlEntity? {
        return UrlEntity(JSON: self.toJSON())
    }
}

