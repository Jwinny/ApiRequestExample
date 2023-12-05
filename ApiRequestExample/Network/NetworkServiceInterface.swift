//
//  NetworkServiceInterface.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

protocol NetworkServiceInterface {
    func request<Request: RequestTemplate>(
        _ request: Request,
        using session: URLSession,
        completion: @escaping (Result<Request.Response, NetworkServiceError>) -> Void)
}
