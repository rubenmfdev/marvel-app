//
//  Constants.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

struct Constants {
    struct Content {
        struct Controller {
        }
        struct Cells {
            static let MarvelList               = "MarvelListTableViewCell"
        }
    }
    struct API {
        struct ConfigurationKey {
            static let BaseURL                  = "kBaseURL"
        }
        struct Credential {
        }
    }
    struct Accessibility {
        struct MarvelList {
            static let tableView                = "marvelList_tableView"
            static let tableViewCell            = "marvelList_tableViewCell"
            static let cellImage                = "marvelList_cellImage"
            static let cellLabel                = "marvelList_cellLabel"
        }
        struct MarvelDetail {
            static let image                    = "marvelDetail_image"
            static let title                    = "marvelDetail_title"
            static let description              = "marvelDetail_description"
        }
    }
}

