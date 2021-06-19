//
//  MarvelListViewModelTest.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import XCTest
@testable import marvel_app

class MarvelListViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMarvelListViewModel_loadCharacters_success() throws {
        let viewModel = MarvelListViewModel(getCharactersUseCase: GetCharactersUseCaseMock(config: .withData))
        viewModel.loadCharacters { error in
            XCTAssertTrue(error == nil)
        }
    }
    
    func testMarvelListViewModel_loadCharacters_error() throws {
        let viewModel = MarvelListViewModel(getCharactersUseCase: GetCharactersUseCaseMock(config: .withoutData))
        viewModel.loadCharacters { error in
            XCTAssertTrue(error != nil)
        }
    }
}
