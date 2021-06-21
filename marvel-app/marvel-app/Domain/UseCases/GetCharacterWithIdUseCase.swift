//
//  GetCharacterUseCase.swift
//  marvel-app
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation

public protocol GetCharacterWithIdUseCaseProtocol {
    func execute(input: GetCharacterWithIdUseCaseInput, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void)
}

class GetCharacterWithIdUseCase: GetCharacterWithIdUseCaseProtocol {

    // MARK: - Attributes
    
    let repository: CharactersRepository
    
    // MARK: - Initializer
    
    init(repository: CharactersRepository) {
        self.repository = repository
    }
    
    // MARK: - GetCharactersUseCaseProtocol
    
    func execute(input: GetCharacterWithIdUseCaseInput, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void) {
        self.repository.getCharacterWithId(input.characterId, filters: input.filters, completion: completion)
    }
}

public struct GetCharacterWithIdUseCaseInput {
    let characterId: Int
    let filters: CharacterFilterEntity
}
