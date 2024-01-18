//
//  MODAV_SwiftUIApp.swift
//  MODAV SwiftUI
//
//  Created by Emin Emini on 17.12.2023..
//

import SwiftUI

@main
struct MODAV_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = UserViewModel(orchestrator: UserOrchestrator(adapter: UserAPIManager.shared))
            UserView()
        }
    }
}
