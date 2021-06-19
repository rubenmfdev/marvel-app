//
//  MarvelListViewController.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import UIKit
import SVProgressHUD

protocol MarvelListViewControllerDelegate {
    func characterSelected(characterId: Int)
}

class MarvelListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Attributes
    
    var viewModel: MarvelListViewModelProtocol
    var delegate: MarvelListViewControllerDelegate?
    
    // MARK: - Initializers
    
    init(viewModel: MarvelListViewModelProtocol, delegate: MarvelListViewControllerDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "marvelList_title".localize
    }
}

private extension MarvelListViewController {
    func setup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.registerCells()
        self.loadData()
    }
    
    func registerCells() {
        self.tableView.register(
            UINib(
                nibName: Constants.Content.Cells.MarvelList,
                bundle: Bundle.main),
            forCellReuseIdentifier: Constants.Content.Cells.MarvelList
        )
    }
    
    func loadData() {
        SVProgressHUD.show()
        viewModel.loadCharacters { error in
            SVProgressHUD.dismiss()
            self.viewModel.setIsLoadingData(loadingData: false)
            if let errorMessage = error {
                self.alert(message: errorMessage)
            } else {
                self.tableView.reloadData()
            }
        }
    }
}

extension MarvelListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.getCharacters().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Content.Cells.MarvelList, for: indexPath) as! MarvelListTableViewCell
        let character = self.viewModel.getCharacters()[indexPath.row]
        cell.config(character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.viewModel.getCharacters().count - 1
        if !self.viewModel.getIsLoadingData() && indexPath.row == lastElement && self.viewModel.getHasMoreData() {
            self.viewModel.setIsLoadingData(loadingData: true)
            loadData()
        }
    }
}

extension MarvelListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = self.viewModel.getCharacters()[indexPath.row]
        if let characterId = character.id {
            self.delegate?.characterSelected(characterId:characterId)
        }
    }
}
