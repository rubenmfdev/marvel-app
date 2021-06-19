//
//  CharactersRepositoryMock.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
@testable import marvel_app

enum CharactersRepositoryMockConfig {
    case withData
    case withoutData
}

class CharactersRepositoryMock: CharactersRepository {
    
    let config: CharactersRepositoryMockConfig
    
    init(config: CharactersRepositoryMockConfig) {
        self.config = config
    }
    
    func getCharacters(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void ) {
        if config == .withData {
            completion(.success(CharacterDataWrapperEntity.mock))
        } else {
            completion(.failure(DataError.domainMappingError))
        }    }
    func getCharacterWithId(_ characterId: Int, filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void ) {
        if config == .withData {
            completion(.success(CharacterDataWrapperEntity.mock))
        } else {
            completion(.failure(DataError.domainMappingError))
        }
    }
}
