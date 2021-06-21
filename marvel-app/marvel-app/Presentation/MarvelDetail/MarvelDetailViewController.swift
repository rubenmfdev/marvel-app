//
//  MarvelDetailViewController.swift
//  marvel-app
//
//  Created by Ruben Marquez on 19/06/2021.
//

import UIKit
import SkeletonView

class MarvelDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Attributes
    
    var viewModel: MarvelDetailViewModelProtocol
    
    // MARK: - Initializers
    
    init(viewModel: MarvelDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.showAnimatedGradientSkeleton()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "marvelDetail_title".localize
    }
    
    // MARK: - Actions
    
}

private extension MarvelDetailViewController {
    func setup() {
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.loadData()
        self.addAccessibilityIds()
    }
    

    func loadData() {
        self.viewModel.loadCharacter { [unowned self] (error, character) in
            self.view.hideSkeleton()
            if let errorMessage = error {
                self.alert(message: errorMessage)
            } else if let character = character {
                self.configView(character)
            } else {
                self.alert(message: DomainError.dataError.localizedDescription)
            }
        }
    }
    
    func configView(_ character: CharacterEntity) {
        self.nameLabel.text = character.name
        if let description = character.characterDescription, description != "" {
            self.descriptionLabel.text = description
        } else {
            self.descriptionLabel.text = "marvelDetail_descriptionLabel_default".localize
        }
        let urlString = "\(character.thumbnail?.path ?? "").\(character.thumbnail?.imageExtension ?? "")"
        let router = ImageRouter(url: urlString)
        self.characterImage.af_setImage(withURLRequest: router)
    }
    
    func addAccessibilityIds() {
        self.characterImage.accessibilityLabel = Constants.Accessibility.MarvelDetail.image
        self.nameLabel.accessibilityLabel = Constants.Accessibility.MarvelDetail.title
        self.descriptionLabel.accessibilityLabel = Constants.Accessibility.MarvelDetail.description
    }
}
