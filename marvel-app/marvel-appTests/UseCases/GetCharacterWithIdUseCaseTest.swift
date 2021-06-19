//
//  GetCharacterWithIdUseCaseTest.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import XCTest
@testable import marvel_app

class GetCharacterWithIdUseCaseTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetCharacterWithIdUseCase_execute_success() throws {
        let useCase = GetCharacterWithIdUseCase(repository: CharactersRepositoryMock(config: .withData))
        useCase.execute(input: GetCharacterWithIdUseCaseInput.mock) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(_):
                XCTAssertTrue(false)
            }
        }
    }
    
    func testGetCharacterWithIdUseCase_execute_error() throws {
        let useCase = GetCharacterWithIdUseCase(repository: CharactersRepositoryMock(config: .withoutData))
        useCase.execute(input: GetCharacterWithIdUseCaseInput.mock) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(false)
            case .failure(_):
                XCTAssertTrue(true)
            }
        }
    }
}
