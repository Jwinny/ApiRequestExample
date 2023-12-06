//
//  GithubUser.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

struct GithubUser {
    struct Request {
    }
    struct Response: Decodable {
        let login: String?
        let avatarUrl: String?
        let bio: String?
    }
}
