//
//  MarvelDetailCoordinator.swift
//  marvel-app
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
import UIKit

class MarvelDetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var characterId: Int

    init(navigationController: UINavigationController, characterId: Int) {
        self.navigationController = navigationController
        self.characterId = characterId
    }

    func start() {
        let vc = MarvelDetailViewController(viewModel: self.inject())
        self.navigationController.pushViewController(vc, animated: false)
    }
}

private extension MarvelDetailCoordinator {
    func inject() -> MarvelDetailViewModelProtocol {
        let charactersDataSource: CharactersDataSource = CharactersNetworkDataSource()
        let charactersRepository: CharactersRepository = CharactersDataRepository(dataSource: charactersDataSource)
        let getCharactersUseCase: GetCharacterWithIdUseCaseProtocol = GetCharacterWithIdUseCase(repository: charactersRepository)
        return MarvelDetailViewModel(getCharacterWithIdUseCase: getCharactersUseCase, characterId: self.characterId)
    }
}
