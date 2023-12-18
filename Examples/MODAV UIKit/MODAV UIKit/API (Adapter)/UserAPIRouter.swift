//
//  UserAPIRouter.swift
//  MODAV UIKit
//
//  Created by Emin Emini on 17.12.2023..
//

import Foundation

// MARK: - Adapter (APIRouter)
enum UserAPIRouter {
    case getUsers(Int)

    var baseURL: URL {
        return URL(string: Config.OAuth.baseURL)!
    }

    var method: String {
        switch self {
        case .getUsers:
            return "GET"
        }
    }

    var path: String {
        switch self {
        case .getUsers:
            return ""
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getUsers(let numberOfUsers):
            return ["results": numberOfUsers]
        }
    }

    func asURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method

        if let parameters = parameters {
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
            urlRequest.url = urlComponents?.url
        }

        return urlRequest
    }
}
