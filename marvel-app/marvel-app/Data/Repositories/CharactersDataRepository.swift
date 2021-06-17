//
//  CharactersDataRepository.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

class CharactersDataRepository: CharactersRepository {
    
    // MARK: - Attributes
    
    let dataSource: CharactersDataSource
    
    // MARK: - Initializer
    
    init(dataSource: CharactersDataSource) {
        self.dataSource = dataSource
    }
    
    // MARK: - CharactersRepository protocol
    
    func getCharacters(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void ) {
        self.dataSource.getCharacters(filters: filters) { result in
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
