//
//  String+Lozalizable.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation
import Localize_Swift

extension String {
    var localize: String {
        return self.localized()
    }
}
