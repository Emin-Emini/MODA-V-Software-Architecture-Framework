//
//  UserAPIManager.swift
//  MODAV UIKit
//
//  Created by Emin Emini on 17.12.2023..
//

import Foundation

// MARK: - Adapter (APIManager)
class UserAPIManager {
    static let shared = UserAPIManager()

    func getUsers(count: Int, completion: @escaping (Result<[User], Error>) -> Void) {
        let request = UserAPIRouter.getUsers(count).asURLRequest()

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            do {
                let usersResponse = try JSONDecoder().decode(UserResult.self, from: data)
                completion(.success(usersResponse.results))
            } catch {
                print("Decoding error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}
