//
//  ViewController.swift
//  MODAV UIKit
//
//  Created by Emin Emini on 17.12.2023..
//

import UIKit

class UserViewController: UIViewController {

    var orchestrator: UserOrchestrator!
    
    // Dependency is injected through the initializer
    init(orchestrator: UserOrchestrator) {
        self.orchestrator = orchestrator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        orchestrator.delegate = self
        orchestrator.getUsers(count: 10)
    }


}

// MARK: - Delegated Functions
extension UserViewController: UserDelegate {
    func didFetchedSuccessfully(users: [User]) {
        users.forEach { print($0.description) }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
