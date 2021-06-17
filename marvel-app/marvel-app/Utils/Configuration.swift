//
//  Configuration.swift
//  marvel-app
//
//  Created by Ruben Marquez on 16/06/2021.
//

import Foundation

class Configuration: NSObject {
    
    private static let shared = Configuration()
    
    private var configuration: String!
    private var variables: [String : Any]?
    
    
    override init() {
        super.init()
        
        let bundle = Bundle.main
        configuration = bundle.infoDictionary?["Configuration"] as? String
        
        guard let plistPath = bundle.path(forResource: "Config", ofType: "plist") else { return }
        guard let plistData = FileManager.default.contents(atPath: plistPath) else { return }
        var format = PropertyListSerialization.PropertyListFormat.xml
        guard let plistDict = try! PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: &format) as? [String : Any] else { return }
        variables = plistDict[configuration] as? [String : Any]
    }
    
    
    // MARK: - Configuration
    
    open class func configuration() -> String {
        return Configuration.shared.configuration
    }
    
    
    // MARK: - Getters
    open class func baseURL() -> String {
        return Configuration.string(for: Constants.API.ConfigurationKey.BaseURL)
    }
    
    // MARK: - Helpers
    private class func string(for key: String) -> String {
        let sharedConfiguration = Configuration.shared
        if let variables = sharedConfiguration.variables {
            print(">>> [key: \(key) | value: \(variables[key] ?? "")]")
            return variables[key] as! String
        }
        return ""
    }
    
    private class func bool(for key: String) -> Bool {
        let sharedConfiguration = Configuration.shared
        if let variables = sharedConfiguration.variables {
            print(">>> [key: \(key) | value: \(variables[key] ?? false)]")
            return variables[key] as! Bool
        }
        return false
    }

}
