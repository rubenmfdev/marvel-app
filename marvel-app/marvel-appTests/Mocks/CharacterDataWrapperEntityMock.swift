//
//  CharacterDataWrapperEntity.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
@testable import marvel_app

extension CharacterDataWrapperEntity {
    class var mock: CharacterDataWrapperEntity {
        let results: [CharacterEntity] = [CharacterEntity(JSON: ["": ""])!]
        let container = CharacterDataContainerEntity(JSON: ["count": 20])!
        container.results = results
        let wrapper = CharacterDataWrapperEntity(JSON: ["":""])!
        wrapper.data = container
        return wrapper
    }
}
