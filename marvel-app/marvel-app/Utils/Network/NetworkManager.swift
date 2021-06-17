//
//  NetworkManager.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class NetworkManager {
    
    // MARK: - Attributes
    
    private let sessionManager: SessionManager
    
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager(sessionManager: SessionManager())
        return networkManager
    }()
    
    // MARK: - Initializers
    
    private init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    // MARK: - Accessors
    
    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
    
    // MARK: - Public methods
    
    func requestObject<T: Mappable>(_ router: BaseRouter, completion: @escaping (Swift.Result<T, Error>) -> Void) {
        self.sessionManager.request(router).validate().responseObject { (response: DataResponse<T>) in
            debugPrint(response)
            switch response.result {
            case let .success(value):
                if let code = response.response?.statusCode, let httpCode = HTTPStatusCode(rawValue: code), httpCode.responseType == .success {
                    completion(.success(value))
                } else {
                    completion(.failure(NetworkError.genericError))
                }
            case .failure(_):
                completion(.failure(self.parseNetworkError(data: response.data)))
            }
        }
    }

}

private extension NetworkManager {
    private func parseNetworkError(data: Data?) -> NetworkError {
        let jsonString = String(data: data ?? Data(), encoding: .utf8)
        if let json = jsonString?.toDict(), let message = json["message"] as? String {
            return .specificError(message: message)
        } else {
            return .genericError
        }
    }
}
