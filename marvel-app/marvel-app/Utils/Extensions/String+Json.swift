//
//  String+Json.swift
//  marvel-app
//
//  Created by Ruben Marquez on 17/06/2021.
//

import Foundation

extension String {
    func toDict() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                #warning("TODO throw error")
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
