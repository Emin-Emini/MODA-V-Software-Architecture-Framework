//
//  UserView.swift
//  MODAV2 SwiftUI
//
//  Created by Emin Emini on 19.12.2023..
//

import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel = UserViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users, id: \.email) { user in
                VStack(alignment: .leading) {
                    Text("Name: \(user.name.first) \(user.name.last)")
                    Text("Email: \(user.email)")
                    Text("Phone: \(user.phone)")
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.getUsers(count: 10)
            }
        }
        .alert(isPresented: Binding<Bool>.constant(viewModel.errorMessage != nil), content: {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
        })
    }
}

#Preview {
    UserView()
}

