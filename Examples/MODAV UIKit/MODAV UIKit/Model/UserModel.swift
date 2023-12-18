//
//  UserModel.swift
//  MODAV UIKit
//
//  Created by Emin Emini on 17.12.2023..
//

import Foundation

// MARK: - Model
struct UserResult: Codable {
    let results: [User]
}

class User: Codable {
    var name: Name
    var email: String = ""
    var phone: String = ""
}

class Name: Codable {
    var first: String = ""
    var last: String = ""
}

extension User: CustomStringConvertible {
    var description: String {
        return "Name: \(name.first) \(name.last), Email: \(email), Phone: \(phone)"
    }
}
