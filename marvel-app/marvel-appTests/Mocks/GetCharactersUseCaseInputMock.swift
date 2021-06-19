//
//  GetCharactersUseCaseInputMock.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
@testable import marvel_app

extension GetCharactersUseCaseInput {
    static var mock: GetCharactersUseCaseInput {
        GetCharactersUseCaseInput(filters: CharacterFilterEntity.mock)
    }
}
