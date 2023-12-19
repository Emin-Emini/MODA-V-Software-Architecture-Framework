//
//  UserViewDelegate.swift
//  MODAV2 SwiftUI
//
//  Created by Emin Emini on 19.12.2023..
//

import Foundation

// MARK: - Delegate
protocol UserViewDelegate: AnyObject {
    func didFetchedSuccessfully(users: [User])
    func didFailWithError(error: Error)
}
