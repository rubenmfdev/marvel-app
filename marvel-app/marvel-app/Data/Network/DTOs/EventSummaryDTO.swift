//
//  EventSummary.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class EventSummaryDTO: NSObject, Mappable {
    var resourceURI: String?
    var name: String?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        resourceURI                 <- map["resourceURI"]
        name                        <- map["name"]
    }
}

extension EventSummaryDTO {
    public func toDomain() -> EventSummaryEntity? {
        return EventSummaryEntity(JSON: self.toJSON())
    }
}
