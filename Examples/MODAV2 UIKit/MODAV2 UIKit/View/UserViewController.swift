//
//  UserViewController.swift
//  MODAV2 UIKit
//
//  Created by Emin Emini on 19.12.2023..
//

import UIKit

class UserViewController: UIViewController {

    var orchestrator: UserOrchestratorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userOrchestrator = UserOrchestrator()
        self.orchestrator = userOrchestrator
        userOrchestrator.viewDelegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        orchestrator?.getUsers(count: 10)
    }

}

// MARK: - Delegated Functions
extension UserViewController: UserViewDelegate {
    func didFetchedSuccessfully(users: [User]) {
        users.forEach { print($0.description) }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
