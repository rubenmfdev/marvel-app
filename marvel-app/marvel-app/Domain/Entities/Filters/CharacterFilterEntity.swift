//
//  CharacterFilterEntity.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation
import ObjectMapper

public class CharacterFilterEntity: NSObject {
    var name: String?
    var nameStartsWith: String?
    var modifiedSince: String?
    var comics: String?
    var series: String?
    var events: String?
    var stories: String?
    var orderBy: CharacterFilterOrder?
    var limit: Int?
    var offset: Int?
}

enum CharacterFilterOrder {
    case name(ascendant: Bool)
    case modified(ascendant: Bool)
    
    func value() -> String {
        switch self {
        case let .name(ascendant):
            return ascendant ? "name" : "-name"
        case let .modified(ascendant):
            return ascendant ? "modified" : "-modified"
        }
    }
}
