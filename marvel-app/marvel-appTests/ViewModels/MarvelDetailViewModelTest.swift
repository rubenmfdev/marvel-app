//
//  MarvelDetailViewModelTest.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import XCTest
@testable import marvel_app

class MarvelDetailViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMarvelDetailViewModel_loadCharacter_success() throws {
        let viewModel = MarvelDetailViewModel(getCharacterWithIdUseCase: GetCharacterWithIdUseCaseMock(config: .withData), characterId: 1)
        viewModel.loadCharacter { (error, character) in
            XCTAssertTrue(character != nil)
            XCTAssertTrue(error == nil)
        }
    }
    
    func testMarvelDetailViewModel_loadCharacter_error() throws {
        let viewModel = MarvelDetailViewModel(getCharacterWithIdUseCase: GetCharacterWithIdUseCaseMock(config: .withoutData), characterId: 1)
        viewModel.loadCharacter { (error, character) in
            XCTAssertTrue(character == nil)
            XCTAssertTrue(error != nil)
        }
    }
}
