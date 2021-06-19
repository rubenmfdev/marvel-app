//
//  Image.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class ImageDTO: NSObject, Mappable {
    var path: String?
    var imageExtension: String?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        path                        <- map["path"]
        imageExtension              <- map["extension"]
    }
}

extension ImageDTO {
    public func toDomain() -> ImageEntity? {
        return ImageEntity(JSON: self.toJSON())
    }
}

