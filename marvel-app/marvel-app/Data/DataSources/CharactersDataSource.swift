//
//  CharactersDataSource.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Foundation

protocol CharactersDataSource {
    func getCharacters(filters: CharacterFilterEntity, completion: @escaping (Result<CharacterDataWrapperDTO, Error>) -> Void )
}
