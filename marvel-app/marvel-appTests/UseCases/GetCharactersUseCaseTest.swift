//
//  GetCharactersUseCaseTest.swift
//  marvel-appTests
//
//  Created by Ruben Marquez on 19/06/2021.
//

import XCTest
@testable import marvel_app

class GetCharactersUseCaseTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetCharactersUseCase_execute_success() throws {
        let useCase = GetCharactersUseCase(repository: CharactersRepositoryMock(config: .withData))
        useCase.execute(input: GetCharactersUseCaseInput.mock) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(true)
            case .failure(_):
                XCTAssertTrue(false)
            }
        }
    }
    
    func testGetCharactersUseCase_execute_error() throws {
        let useCase = GetCharactersUseCase(repository: CharactersRepositoryMock(config: .withoutData))
        useCase.execute(input: GetCharactersUseCaseInput.mock) { result in
            switch result {
            case .success(_):
                XCTAssertTrue(false)
            case .failure(_):
                XCTAssertTrue(true)
            }
        }
    }
}
