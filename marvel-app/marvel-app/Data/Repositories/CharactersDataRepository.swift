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
        self.dataSource.getCharacters(filters: filters, completion: completion)
    }
    
    func getCharacterWithId(_ characterId: Int, filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void ) {
        self.dataSource.getCharactersWithId(characterId, filters: filters, completion:  completion)
    }
}
