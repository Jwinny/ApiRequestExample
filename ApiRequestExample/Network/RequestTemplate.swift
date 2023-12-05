//
//  File.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

protocol RequestTemplate {
    associatedtype Response

    var url: URL? { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    var queryItems: [String: String] { get }
    var data: Data? { get }

    func decode(_ data: Data) throws -> Response
}

extension RequestTemplate {
    var headers: [String: String] { [:] }
    var queryItems: [String: String] { [:] }
    var data: Data? { nil }
}

extension RequestTemplate where Self: Encodable {
    var data: Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try? encoder.encode(self)
    }
}

extension RequestTemplate where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Response.self, from: data)
    }
}
