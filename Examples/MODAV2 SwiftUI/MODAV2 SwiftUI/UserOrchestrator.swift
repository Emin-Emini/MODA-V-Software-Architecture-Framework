//
//  UserOrchestrator.swift
//  MODAV2 SwiftUI
//
//  Created by Emin Emini on 19.12.2023..
//

import Foundation

// MARK: - Orchestrator
class UserOrchestrator: UserOrchestratorDelegate {
    weak var delegate: UserViewDelegate?
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
