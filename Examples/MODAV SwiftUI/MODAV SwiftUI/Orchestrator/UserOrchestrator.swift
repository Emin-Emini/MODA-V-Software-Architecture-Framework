//
//  UserOrchestrator.swift
//  MODAV SwiftUI
//
//  Created by Emin Emini on 17.12.2023..
//

import Foundation

// MARK: - Orchestrator
class UserOrchestrator {
    weak var delegate: UserDelegate?
    private let adapter = UserAPIManager()
    
    func getUsers(count: Int) {
        UserAPIManager.shared.getUsers(count: count) { result in
            switch result {
            case .success(let users):
                // Handle success with users array
                self.delegate?.didFetchedSuccessfully(users: users)
            case .failure(let error):
                // Handle error
                self.delegate?.didFailWithError(error: error)
            }
        }

    }
}
