//
//  MarvelListCoordinator.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation
import UIKit

class MarvelListCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MarvelListViewController(viewModel: self.inject(), delegate: self)
        self.navigationController.pushViewController(vc, animated: false)
    }
}

private extension MarvelListCoordinator {
    func inject() -> MarvelListViewModelProtocol {
        let charactersDataSource: CharactersDataSource = CharactersNetworkDataSource()
        let charactersRepository: CharactersRepository = CharactersDataRepository(dataSource: charactersDataSource)
        let getCharactersUseCase: GetCharactersUseCaseProtocol = GetCharactersUseCase(repository: charactersRepository)
        return MarvelListViewModel(getCharactersUseCase: getCharactersUseCase)
    }
}

extension MarvelListCoordinator: MarvelListViewControllerDelegate {
    func characterSelected(characterId: Int) {
        let detailCoordinator = MarvelDetailCoordinator(navigationController: self.navigationController, characterId: characterId)
        detailCoordinator.start()
    }
}
 
