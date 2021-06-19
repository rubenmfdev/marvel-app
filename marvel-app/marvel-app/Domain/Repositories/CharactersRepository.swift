//
//  CharactersRepository.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

protocol CharactersRepository {
    func getCharacters(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void )
    func getCharacterWithId(_ characterId: Int, filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperEntity, Error>) -> Void )
}
