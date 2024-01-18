//
//  UserAPIDelegate.swift
//  MODAV SwiftUI
//
//  Created by Emin Emini on 18.01.2024..
//

import Foundation

protocol UserAPIDelegate {
    func getUsers(count: Int, completion: @escaping (Result<[User], Error>) -> Void)
}
