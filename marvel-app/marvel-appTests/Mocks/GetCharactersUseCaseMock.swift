//
//  GetCharactersUseCaseMock.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
@testable import marvel_app

enum GetCharactersUseCaseMockConfig {
    case withData
    case withoutData
}

class GetCharactersUseCaseMock: GetCharactersUseCaseProtocol {
    
    let config: GetCharactersUseCaseMockConfig
    
    init(config: GetCharactersUseCaseMockConfig) {
        self.config = config
    }
    
    func execute(input: GetCharactersUseCaseInput, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void) {
        if config == .withData {
            completion(.success(CharacterDataWrapperEntity.mock))
        } else {
            completion(.failure(DataError.domainMappingError))
        }
    }

}
