//
//  CharactersRepositoryTest.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import XCTest
@testable import marvel_app

class CharactersDataRepositoryTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharactersDataRepository_getCharacters_success() throws {
        let repo = CharactersDataRepository(dataSource: CharactersDataSourceMock(config: .withData))
        repo.getCharacters(filters: CharacterFilterEntity.mock) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(_):
                XCTAssertTrue(false)
            }
        }
    }
    
    func testCharactersDataRepository_getCharacters_error() throws {
        let repo = CharactersDataRepository(dataSource: CharactersDataSourceMock(config: .withoutData))
        repo.getCharacters(filters: CharacterFilterEntity.mock) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(false)
            case .failure(_):
                XCTAssertTrue(true)
            }
        }
    }
    
    func testCharactersDataRepository_getCharacterWithId_success() throws {
        let repo = CharactersDataRepository(dataSource: CharactersDataSourceMock(config: .withData))
        repo.getCharacterWithId(1, filters: CharacterFilterEntity.mock) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(_):
                XCTAssertTrue(false)
            }
        }
    }
    
    func testCharactersDataRepository_getCharacterWithId_error() throws {
        let repo = CharactersDataRepository(dataSource: CharactersDataSourceMock(config: .withoutData))
        repo.getCharacterWithId(1, filters: CharacterFilterEntity.mock) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(false)
            case .failure(_):
                XCTAssertTrue(true)
            }
        }
    }
}
