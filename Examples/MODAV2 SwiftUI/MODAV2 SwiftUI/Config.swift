//
//  Config.swift
//  MODAV2 SwiftUI
//
//  Created by Emin Emini on 19.12.2023..
//

import Foundation

// MARK: - Config File
class Config {
    struct App {
        static let bundleId = Bundle.main.bundleIdentifier
    }
    
    struct OAuth {
        static var absoluteURL = "https://randomuser.me"
        static var baseURL = absoluteURL + "/api/"
    }
}
