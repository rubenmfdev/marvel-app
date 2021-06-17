//
//  CharactersRouter.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Foundation
import Alamofire

enum CharactersEndpoint {
    case character
    case characterWithId(_ id: String)
    case characterComics(_ id: String)
    case characterEvents(_ id: String)
    case characterSeries(_ id: String)
    case characterStories(_ id: String)
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
        case let .characterWithId(id):
            return "\(id)"
        case let .characterComics(id):
            return "\(id)/comics"
        case let .characterEvents(id):
            return "\(id)/events"
        case let .characterSeries(id):
            return "\(id)/series"
        case let .characterStories(id):
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
        nil
    }
    
    override var authType: AuthType {
        return .marvel
    }
    
}
