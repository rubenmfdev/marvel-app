//
//  DomainError.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

enum DomainError: Error {
    case dataError
}

extension DomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .dataError:
            return "noDataError".localize
        }
    }
}
