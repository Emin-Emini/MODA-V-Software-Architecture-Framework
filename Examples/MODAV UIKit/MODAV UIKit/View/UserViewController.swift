//
//  ViewController.swift
//  MODAV UIKit
//
//  Created by Emin Emini on 17.12.2023..
//

import UIKit

class UserViewController: UIViewController {

    var orchestrator: UserOrchestrator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        orchestrator = UserOrchestrator()
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
