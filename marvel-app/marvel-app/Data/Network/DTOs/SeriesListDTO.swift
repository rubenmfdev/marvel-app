//
//  SeriesList.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class SeriesListDTO: NSObject, Mappable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [SeriesSummaryDTO]?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        available                   <- map["available"]
        returned                    <- map["returned"]
        collectionURI               <- map["collectionURI"]
        items                       <- map["items"]
    }
}

extension SeriesListDTO {
    public func toDomain() -> SeriesListEntity? {
        return SeriesListEntity(JSON: self.toJSON())
    }
}

