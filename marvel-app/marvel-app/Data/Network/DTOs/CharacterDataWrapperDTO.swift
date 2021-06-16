//
//  CharacterDataWrapper.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class CharacterDataWrapperDTO: NSObject, Mappable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var data: CharacterDataContainerDTO?
    var etag: String?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        code                        <- map["code"]
        status                      <- map["status"]
        copyright                   <- map["copyright"]
        attributionText             <- map["attributionText"]
        attributionHTML             <- map["attributionHTML"]
        data                        <- map["data"]
        etag                        <- map["etag"]
    }
}

extension CharacterDataWrapperDTO {
    public func toDomain() -> CharacterDataWrapperEntity? {
        return CharacterDataWrapperEntity(JSON: self.toJSON())
    }
}

