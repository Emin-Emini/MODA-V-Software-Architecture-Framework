//
//  UserAPIDelegate.swift
//  MODAV UIKit
//
//  Created by Emin Emini on 11.01.2024..
//

import Foundation

protocol UserAPIDelegate {
    func getUsers(count: Int, completion: @escaping (Result<[User], Error>) -> Void)
}
