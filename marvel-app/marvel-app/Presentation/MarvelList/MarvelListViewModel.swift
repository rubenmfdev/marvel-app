//
//  MarvelListViewModel.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

protocol MarvelListViewModelProtocol {
    func getCharacters(completion: @escaping (String?) -> Void)
}

class MarvelListViewModel: MarvelListViewModelProtocol {
    
    // MARK: - Attributes
    
    var characters: [CharacterEntity] = []
    var getCharactersUseCase: GetCharactersUseCaseProtocol
    var filter: CharacterFilterEntity = CharacterFilterEntity()
    
    // MARK: - Initializer
    
    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    // MARK: - Publi methods
    
    func getCharacters(completion: @escaping (String?) -> Void) {
        self.getCharactersUseCase.execute(input: self.filter) { result in
            switch result {
            case let .success(value):
                if let count = value.data?.count, let results = value.data?.results {
                    self.filter.offset = (self.filter.offset ?? 0) + count
                    self.characters = results
                    completion(nil)
                } else {
                    completion(DomainError.dataError.localizedDescription)
                }
            case let .failure(error):
                completion(error.localizedDescription)
            }
        }
    }
}
