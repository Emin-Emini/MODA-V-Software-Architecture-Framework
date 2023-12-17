//
//  UserModelView.swift
//  MODAV SwiftUI
//
//  Created by Emin Emini on 17.12.2023..
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?

    private var orchestrator: UserOrchestrator

    init(orchestrator: UserOrchestrator = UserOrchestrator()) {
        self.orchestrator = orchestrator
        self.orchestrator.delegate = self
    }

    func fetchUsers(count: Int) {
        orchestrator.getUsers(count: count)
    }
}

extension UserViewModel: UserDelegate {
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

