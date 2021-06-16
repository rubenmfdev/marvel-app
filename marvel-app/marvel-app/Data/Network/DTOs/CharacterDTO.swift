//
//  Character.swift
//  marvel-app
//
//  Created by Ruben Marquez on 15/06/2021.
//

import Foundation
import ObjectMapper

public class CharacterDTO: NSObject, Mappable {
    var id: Int?
    var name: String?
    var characterDescription: String?
    var modified: String?
    var resourceURI: String?
    var urls: [UrlDTO]?
    var thumbnail: ImageDTO?
    var comics: ComicListDTO?
    var stories: StoryListDTO?
    var events: EventListDTO?
    var series: SeriesListDTO?

    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        id                          <- map["id"]
        name                        <- map["name"]
        characterDescription        <- map["description"]
        modified                    <- map["modified"]
        resourceURI                 <- map["resourceURI"]
        urls                        <- map["urls"]
        thumbnail                   <- map["thumbnail"]
        comics                      <- map["comics"]
        stories                     <- map["stories"]
        events                      <- map["events"]
        series                      <- map["series"]

    }
}

extension CharacterDTO {
    public func toDomain() -> CharacterEntity? {
        return CharacterEntity(JSON: self.toJSON())
    }
}
