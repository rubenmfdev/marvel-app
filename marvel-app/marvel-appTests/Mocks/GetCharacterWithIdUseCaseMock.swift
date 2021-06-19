//
//  GetCharacterWithIdUseCaseMock.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
@testable import marvel_app

enum GetCharacterWithIdUseCaseMockConfig {
    case withData
    case withoutData
}

class GetCharacterWithIdUseCaseMock: GetCharacterWithIdUseCaseProtocol {
    
    let config: GetCharacterWithIdUseCaseMockConfig
    
    init(config: GetCharacterWithIdUseCaseMockConfig) {
        self.config = config
    }
    
    func execute(input: GetCharacterWithIdUseCaseInput, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void) {
        if config == .withData {
            completion(.success(CharacterDataWrapperEntity.mock))
        } else {
            completion(.failure(DataError.domainMappingError))
        }
    }
}
