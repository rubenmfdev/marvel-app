//
//  MarvelListViewModel.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

protocol MarvelListViewModelProtocol {
    func loadCharacters(completion: @escaping (String?) -> Void)
    func getCharacters() -> [CharacterEntity]
    func setIsLoadingData(loadingData: Bool)
    func getIsLoadingData() -> Bool
    func getHasMoreData() -> Bool
    func addSearchText(searchText: String)
}

class MarvelListViewModel: MarvelListViewModelProtocol {
    
    // MARK: - Attributes
    
    var characters: [CharacterEntity] = []
    var getCharactersUseCase: GetCharactersUseCaseProtocol
    var filter: CharacterFilterEntity = CharacterFilterEntity()
    var isLoadingData: Bool = false
    var hasMoreData: Bool = true
    
    // MARK: - Initializer
    
    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    // MARK: - MarvelListViewModelProtocol
    
    func loadCharacters(completion: @escaping (String?) -> Void) {
        self.getCharactersUseCase.execute(input: GetCharactersUseCaseInput(filters: self.filter)) { [unowned self] result in
            switch result {
            case let .success(value):
                if let count = value.data?.count, let results = value.data?.results {
                    self.filter.offset = (self.filter.offset ?? 0) + count
                    self.characters.append(contentsOf: results)
                    self.hasMoreData = results.count > 0
                    completion(nil)
                } else {
                    completion(DomainError.dataError.localizedDescription)
                }
            case let .failure(error):
                completion(error.localizedDescription)
            }
        }
    }
    
    func getCharacters() -> [CharacterEntity] {
        return self.characters
    }
    
    func setIsLoadingData(loadingData: Bool) {
        self.isLoadingData = loadingData
    }
    func getIsLoadingData() -> Bool {
        self.isLoadingData
    }
    
    func getHasMoreData() -> Bool {
        self.hasMoreData
    }
    
    func addSearchText(searchText: String) {
        if searchText == "" {
            self.filter.nameStartsWith = nil
        } else {
            self.filter.nameStartsWith = searchText
        }
        self.characters = []
        self.filter.offset = 0
    }
}
