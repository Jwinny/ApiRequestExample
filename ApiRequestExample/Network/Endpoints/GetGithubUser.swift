//
//  GetGithubUser.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

extension GithubUser.Request: RequestTemplate {
    typealias Response = GithubUser.Response
    var url: URL? {
        var components: URLComponents = Server.github
        components.path += path
        return components.url
    }

    var method: HTTPMethod {.get}

    var path: String {"/users/\(KeysService.get(.username) as? String ?? "")"}

}
