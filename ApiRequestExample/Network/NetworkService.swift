//
//  NetworkService.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

class NetworkService: NetworkServiceInterface {

    static let shared: NetworkService = NetworkService()

    func request<Request: RequestTemplate>(
        _ request: Request,
        using session: URLSession = URLSession.shared,
        completion: @escaping (Result<Request.Response, NetworkServiceError>) -> Void) {
            guard let url = request.url else {
                return completion(.failure(NetworkServiceError.urlCreateError))
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.method.rawValue
            urlRequest.httpBody = request.data
            urlRequest.allHTTPHeaderFields = request.headers

            session.dataTask(with: urlRequest) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        return completion(.failure(NetworkServiceError.unknownError))
                    }

                    guard let httpResponse = response as? HTTPURLResponse else {
                        return completion(.failure(NetworkServiceError.unknownError))
                    }

                    switch httpResponse.statusCode {
                    case 401:
                        return completion(.failure(NetworkServiceError.unauthorized))
                    case 400...499:
                        return completion(.failure(NetworkServiceError.clientError))
                    case 500...599:
                        return completion(.failure(NetworkServiceError.serverError))
                    default:
                        break
                    }

                    guard let data = data else {
                        return completion(.failure(NetworkServiceError.unknownError))
                    }

                    do {
                        return try completion(.success(request.decode(data)))
                    } catch {
                        completion(.failure(NetworkServiceError.decodeError))
                    }
                }
            }.resume()
        }
}
