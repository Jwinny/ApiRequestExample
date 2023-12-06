//
//  Server.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

struct Server {
    static let github: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        return components
    }()
}
