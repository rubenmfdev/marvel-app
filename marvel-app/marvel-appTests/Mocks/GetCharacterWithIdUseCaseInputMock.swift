//
//  GetCharacterWithIdUseCaseInputMock.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
@testable import marvel_app

extension GetCharacterWithIdUseCaseInput {
    static var mock: GetCharacterWithIdUseCaseInput {
        GetCharacterWithIdUseCaseInput(characterId: 1, filters: CharacterFilterEntity.mock)
    }
}
