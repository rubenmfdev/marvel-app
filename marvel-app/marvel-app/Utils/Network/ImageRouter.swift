//
//  ImageRouter.swift
//  marvel-app
//
//  Created by Ruben Marquez on 18/06/2021.
//

import Foundation
import Alamofire

class ImageRouter: URLRequestConvertible {
    
    let urlString: String
    
    init(url: String) {
        self.urlString = url
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest!
        urlRequest = URLRequest(url: URL(string: self.urlString)!)
        debugPrint(urlRequest!)
        return urlRequest
    }
    
}
