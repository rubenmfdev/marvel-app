//
//  MarvelListViewController.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import UIKit

class MarvelListViewController: UIViewController {
    
    // MARK: - Attributes
    
    var viewModel: MarvelListViewModelProtocol
    
    // MARK: - Initializers
    
    init(viewModel: MarvelListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCharacters { error in
            if let error = error {
                let a = error
            } else {
                let suc = 4
            }
        }
    }
}
