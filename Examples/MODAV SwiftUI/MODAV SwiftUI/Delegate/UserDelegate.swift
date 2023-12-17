//
//  UserDelegate.swift
//  MODAV SwiftUI
//
//  Created by Emin Emini on 17.12.2023..
//

import Foundation

// MARK: - Delegate
protocol UserDelegate: AnyObject {
    func didFetchedSuccessfully(users: [User])
    func didFailWithError(error: Error)
}
