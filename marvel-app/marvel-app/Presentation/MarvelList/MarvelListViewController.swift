//
//  MarvelListViewController.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import UIKit
import SkeletonView

protocol MarvelListViewControllerDelegate {
    func characterSelected(characterId: Int)
}

class MarvelListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Attributes
    
    var viewModel: MarvelListViewModelProtocol
    var delegate: MarvelListViewControllerDelegate?
    var skeletonWasShown = false
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !self.skeletonWasShown {
            self.tableView.showAnimatedGradientSkeleton()
            self.skeletonWasShown = true
        }
    }
}

private extension MarvelListViewController {
    func setup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 120.0
        self.registerCells()
        self.loadData()
        self.addAccessibilityIds()
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
        viewModel.loadCharacters { error in
            self.tableView.hideSkeleton()
            self.viewModel.setIsLoadingData(loadingData: false)
            if let errorMessage = error {
                self.alert(message: errorMessage)
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    func addAccessibilityIds() {
        self.tableView.accessibilityLabel = Constants.Accessibility.MarvelList.tableView
    }
    
    @objc func updateSearch(searchText: Any) {
        if let searchText = searchText as? String {
            self.viewModel.addSearchText(searchText: searchText)
            self.viewModel.setIsLoadingData(loadingData: true)
            self.loadData()
        }
    }
}

extension MarvelListViewController: SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return Constants.Content.Cells.MarvelList
    }
    
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
        let lastElement = self.viewModel.getCharacters().count - 5
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

extension MarvelListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        self.perform(#selector(updateSearch), with: searchText, afterDelay: 0.5)
    }
}
