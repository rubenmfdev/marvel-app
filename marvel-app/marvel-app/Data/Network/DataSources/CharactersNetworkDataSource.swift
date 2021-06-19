//
//  CharactersNetworkDataSource.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

class CharactersNetworkDataSource: CharactersDataSource {
    func getCharacters(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void ) {
        self.getCharactersAdapter(filters: filters) { result in
            switch result {
            case let .success(characterDataWrapperDTO):
                if let entity = characterDataWrapperDTO.toDomain() {
                    completion(.success(entity))
                } else {
                    completion(.failure(DataError.domainMappingError))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func getCharactersWithId(_ characterId: Int, filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void ) {
        self.getCharacterWithIdAdapter(characterId, filters: filters) { result in
            switch result {
            case let .success(characterDataWrapperDTO):
                if let entity = characterDataWrapperDTO.toDomain() {
                    completion(.success(entity))
                } else {
                    completion(.failure(DataError.domainMappingError))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

private extension CharactersNetworkDataSource {
    func getCharactersAdapter(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperDTO, Error>) -> Void ) {
        let router = CharactersRouter(.character(filters: filters))
        NetworkManager.shared().requestObject(router, completion: completion)
    }
    
    func getCharacterWithIdAdapter(_ characterId: Int, filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperDTO, Error>) -> Void ) {
        let router = CharactersRouter(.characterWithId(characterId, filters: filters))
        NetworkManager.shared().requestObject(router, completion: completion)
    }
}
