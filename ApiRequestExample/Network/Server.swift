//
//  Server.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

struct Server {
    //Exemplo de Server
    static let ibge: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "servicodados.ibge.gov.br"
        return components
    }()
    static let github: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        return components
    }()
}
