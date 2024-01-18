//
//  UserViewModel.swift
//  MODAV2 SwiftUI
//
//  Created by Emin Emini on 19.12.2023..
//

import Foundation
import Combine

class UserViewModel: ObservableObject, UserOrchestratorDelegate {
    @Published var users: [User] = []
    @Published var errorMessage: String?
    
    private var orchestrator: UserOrchestrator

    init(orchestrator: UserOrchestratorDelegate) {
        self.orchestrator = orchestrator as! UserOrchestrator
        (self.orchestrator as? UserOrchestrator)?.delegate = self
    }
    
    func getUsers(count: Int) {
        orchestrator.getUsers(count: count)
    }
}

extension UserViewModel: UserViewDelegate {
    func didFetchedSuccessfully(users: [User]) {
        DispatchQueue.main.async {
            self.users = users
        }
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
}

