//
//  NetworkErrors.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Foundation

enum NetworkError: Error {
    case genericError
    case specificError(message: String)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .genericError:
            return "networkError".localize
        case let .specificError(message):
            return message
        }
    }
}
