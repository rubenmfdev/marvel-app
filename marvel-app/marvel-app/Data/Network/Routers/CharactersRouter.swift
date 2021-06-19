//
//  CharactersRouter.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Foundation
import Alamofire

enum CharactersEndpoint {
    case character(filters: CharacterFilterEntity)
    case characterWithId(_ id: String, filters: CharacterFilterEntity)
    case characterComics(_ id: String, filters: CharacterFilterEntity)
    case characterEvents(_ id: String, filters: CharacterFilterEntity)
    case characterSeries(_ id: String, filters: CharacterFilterEntity)
    case characterStories(_ id: String, filters: CharacterFilterEntity)
}

class CharactersRouter: BaseRouter {
    
    // MARK: - Attributes
    
    var endpoint: CharactersEndpoint
    
    // MARK: - Initializers
    
    init(_ endpoint: CharactersEndpoint) {
        self.endpoint = endpoint
        super.init()
    }
    
    // MARK: - BaseRouter
    
    override var commonPath: String {
        "characters"
    }
    
    override var baseURL: String {
        return Configuration.baseURL() + commonPath
    }
    
    override var path: String {
        switch self.endpoint {
        case .character:
            return ""
        case let .characterWithId(id, _):
            return "\(id)"
        case let .characterComics(id, _):
            return "\(id)/comics"
        case let .characterEvents(id, _):
            return "\(id)/events"
        case let .characterSeries(id, _):
            return "\(id)/series"
        case let .characterStories(id, _):
            return "\(id)/stories"
        }
    }
    
    override var httpMethod: HTTPMethod {
        .get
    }
    
    override var encoding: ParameterEncoding? {
        URLEncoding.default
    }
    
    override var parameters: [String : Any]? {
        switch self.endpoint {
        case let .character(filters),
             let .characterWithId(_, filters),
             let .characterComics(_ , filters),
             let .characterEvents(_, filters),
             let .characterSeries(_, filters),
             let .characterStories(_, filters):
            return self.getFiltersParameters(filters: filters)
        }
    }
    
    override var authType: AuthType {
        return .marvel
    }
}

private extension CharactersRouter {
    func getFiltersParameters(filters: CharacterFilterEntity) -> [String: Any] {
        var filtersDict: [String: Any]  = [:]
        if let name = filters.name {
            filtersDict["name"] = name
        }
        if let nameStartsWith = filters.nameStartsWith {
            filtersDict["nameStartsWith"] = nameStartsWith
        }
        if let modifiedSince = filters.modifiedSince {
            filtersDict["modifiedSince"] = modifiedSince
        }
        if let comics = filters.comics {
            filtersDict["comics"] = comics
        }
        if let series = filters.series {
            filtersDict["name"] = series
        }
        if let events = filters.events {
            filtersDict["events"] = events
        }
        if let stories = filters.stories {
            filtersDict["stories"] = stories
        }
        if let orderBy = filters.orderBy {
            filtersDict["orderBy"] = orderBy.value()
        }
        if let limit = filters.limit {
            filtersDict["limit"] = limit
        }
        if let offset = filters.offset {
            filtersDict["offset"] = offset
        }
        return filtersDict
    }
}
