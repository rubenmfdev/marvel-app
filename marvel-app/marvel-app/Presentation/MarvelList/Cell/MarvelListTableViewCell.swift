//
//  MarvelListTableViewCell.swift
//  marvel-app
//
//  Created by Ruben Marquez on 18/06/2021.
//

import UIKit
import AlamofireImage

class MarvelListTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    // MARK: - Attributes
    
    
    // MARK: - Configuration

    public func config(_ character: CharacterEntity) {
        self.selectionStyle = .none
        self.nameLabel.text = character.name
        let urlString = "\(character.thumbnail?.path ?? "").\(character.thumbnail?.imageExtension ?? "")"
        let router = ImageRouter(url: urlString)
        self.characterImage.af_setImage(withURLRequest: router, completion:  { _ in
            self.characterImage.hideSkeleton()
        })
        self.addAccessibilityIds()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.characterImage.image = nil
        self.characterImage.showAnimatedGradientSkeleton()
    }
}

private extension MarvelListTableViewCell {
    func addAccessibilityIds() {
        self.accessibilityLabel = Constants.Accessibility.MarvelList.tableViewCell
        self.characterImage.accessibilityLabel = Constants.Accessibility.MarvelList.cellImage
        self.nameLabel.accessibilityLabel = Constants.Accessibility.MarvelList.cellLabel
    }
}
