//
//  GetCharactersUseCase.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

protocol GetCharactersUseCaseProtocol {
    func execute(input: GetCharactersUseCaseInput, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void)
}

class GetCharactersUseCase: GetCharactersUseCaseProtocol {

    // MARK: - Attributes
    
    let repository: CharactersRepository
    
    // MARK: - Initializer
    
    init(repository: CharactersRepository) {
        self.repository = repository
    }
    
    // MARK: - GetCharactersUseCaseProtocol
    
    func execute(input: GetCharactersUseCaseInput, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void) {
        self.repository.getCharacters(filters: input.filters, completion: completion)
    }
}

struct GetCharactersUseCaseInput {
    let filters: CharacterFilterEntity
}
