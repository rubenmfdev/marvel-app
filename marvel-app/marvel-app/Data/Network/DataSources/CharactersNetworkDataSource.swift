//
//  CharactersNetworkDataSource.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

class CharactersNetworkDataSource: CharactersDataSource {
    func getCharacters(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperDTO, Error>) -> Void ) {
        let router = CharactersRouter(.character)
        NetworkManager.shared().requestObject(router, completion: completion)
    }
}
