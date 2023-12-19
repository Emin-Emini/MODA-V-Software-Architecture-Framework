//
//  UserOrchestrator.swift
//  MODAV2 UIKit
//
//  Created by Emin Emini on 19.12.2023..
//

import Foundation

// MARK: - Orchestrator
class UserOrchestrator: UserOrchestratorDelegate {
    weak var viewDelegate: UserViewDelegate?
    var adapter: UserAPIManager?
    
    func getUsers(count: Int) {
        UserAPIManager.shared.getUsers(count: count) { result in
            switch result {
            case .success(let users):
                // Handle success with users array
                self.viewDelegate?.didFetchedSuccessfully(users: users)
            case .failure(let error):
                // Handle error
                self.viewDelegate?.didFailWithError(error: error)
            }
        }
    }
}
