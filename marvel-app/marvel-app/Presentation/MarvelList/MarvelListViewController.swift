//
//  MarvelListViewController.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import UIKit

class MarvelListViewController: UIViewController {
    
    let viewModel: MarvelListViewModel = MarvelListViewModel(getCharactersUseCase: GetCharactersUseCase(repository: CharactersDataRepository(dataSource: CharactersNetworkDataSource())))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.getCharacters { error in
            if let error = error {
                let a = error
            } else {
                let suc = 4
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
