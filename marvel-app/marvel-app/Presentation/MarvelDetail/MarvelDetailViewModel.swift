//
//  MarvelDetailViewModel.swift
//  marvel-app
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation

protocol MarvelDetailViewModelProtocol {
    func loadCharacter(completion: @escaping (String?, CharacterEntity?) -> Void)
    func getCharacter() -> CharacterEntity?
}

class MarvelDetailViewModel: MarvelDetailViewModelProtocol {
    
    // MARK: - Attributes
    
    var character: CharacterEntity?
    var getCharacterWithIdUseCase: GetCharacterWithIdUseCaseProtocol
    var filter: CharacterFilterEntity = CharacterFilterEntity()
    var characterId: Int
    
    // MARK: - Initializer
    
    init(getCharacterWithIdUseCase: GetCharacterWithIdUseCaseProtocol, characterId: Int) {
        self.getCharacterWithIdUseCase = getCharacterWithIdUseCase
        self.characterId = characterId
    }
    
    // MARK: - MarvelListViewModelProtocol
    
    func loadCharacter(completion: @escaping (String?, CharacterEntity?) -> Void) {
        self.getCharacterWithIdUseCase.execute(input: GetCharacterWithIdUseCaseInput(characterId: self.characterId, filters: self.filter)) { [unowned self] result in
            switch result {
            case let .success(value):
                if let results = value.data?.results {
                    self.character = results.first
                    completion(nil, self.character)
                } else {
                    completion(DomainError.dataError.localizedDescription, nil)
                }
            case let .failure(error):
                completion(error.localizedDescription, nil)
            }
        }
    }
    
    func getCharacter() -> CharacterEntity? {
        return self.character
    }
    
}
