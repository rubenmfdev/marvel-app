//
//  CharactersDataSource.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Foundation

public protocol CharactersDataSource {
    func getCharacters(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void )
    func getCharactersWithId(_ characterId: Int, filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void )
}
