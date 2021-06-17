//
//  BaseRouter.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Alamofire
import CryptoKit

enum AuthType: Int {
    case none
    case basic
    case oauth2
    case marvel
    
    func getParams() -> [String: Any] {
        switch self {
        case .none:
            return [:]
        case .basic:
            return [:]
        case .oauth2:
            return [:]
        case .marvel:
            let timestamp = String(Date().timeIntervalSince1970)
            return ["apikey": "91716016929e144c5f696e0bb2acdc25",
                    "ts": timestamp,
                    "hash": self.getHash(params: ["timestamp": timestamp])
            ]
        }
    }
    
    private func getHash(params: [String: String]) -> String {
        switch self {
        case .none:
            return ""
        case .basic:
            return ""
        case .oauth2:
            return ""
        case .marvel:
            let hash = params["timestamp"]! + "bace235de79e2003f445f119a94e14c23dbea789" + "91716016929e144c5f696e0bb2acdc25"
            return hash.toMD5()
        }
    }
}

class BaseRouter {
    
    var commonPath: String {
        fatalError("\"\(#function)\" must be overridden in subclass")
    }
    
    var baseURL: String {
        fatalError("\"\(#function)\" must be overridden in subclass")
    }
    
    var path: String {
        fatalError("\"\(#function)\" must be overridden in subclass")
    }
    
    var httpMethod: HTTPMethod {
        fatalError("\"\(#function)\" must be overridden in subclass")
    }
    
    var encoding: ParameterEncoding? {
        fatalError("\"\(#function)\" must be overridden in subclass")
    }
    
    var parameters: [String : Any]? {
        fatalError("\"\(#function)\" must be overridden in subclass")
    }
    
    var authType: AuthType {
        return .none
    }
    
}

extension BaseRouter: URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest!
        
        if baseURL != "" {
            if path != "" {
                urlRequest = URLRequest(url: URL(string: baseURL)!.appendingPathComponent(path))
            } else {
                urlRequest = URLRequest(url: URL(string: baseURL)!)
            }
        } else {
            urlRequest = URLRequest(url: URL(string: path)!)
        }
        
        urlRequest.httpMethod = httpMethod.rawValue
        
        urlRequest.setValue("", forHTTPHeaderField: "Authorization")
        
        switch self.authType {
        case .none:
            if let encoding = encoding {
                return try encoding.encode(urlRequest, with: parameters)
            }
            break
        case .basic:
            break
        case .oauth2:
            break
        case .marvel:
            var newParameters: [String : Any] = self.authType.getParams()
            if let parameters = self.parameters {
                newParameters.merge(dict: parameters)
            }
            if let encoding = encoding {
                return try encoding.encode(urlRequest, with: newParameters)
            }
        }
        
        debugPrint(urlRequest!)
        return urlRequest
    }
    
}
