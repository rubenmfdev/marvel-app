//
//  DataError.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

enum DataError: Error {
    case domainMappingError
}

extension DataError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .domainMappingError:
            return "domainMappingError".localize
        }
    }
}
