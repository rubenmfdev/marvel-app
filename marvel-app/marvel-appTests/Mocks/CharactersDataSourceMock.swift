//
//  CharactersDataSourceMock.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
@testable import marvel_app

enum CharactersDataSourceMockConfig {
    case withData
    case withoutData
}

class CharactersDataSourceMock: CharactersDataSource {
    
    let config: CharactersDataSourceMockConfig
    
    init(config: CharactersDataSourceMockConfig) {
        self.config = config
    }
    
    func getCharacters(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void ) {
        if config == .withData {
            completion(.success(CharacterDataWrapperEntity.mock))
        } else {
            completion(.failure(DataError.domainMappingError))
        }    }
    func getCharactersWithId(_ characterId: Int, filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void ) {
        if config == .withData {
            completion(.success(CharacterDataWrapperEntity.mock))
        } else {
            completion(.failure(DataError.domainMappingError))
        }
    }
}
