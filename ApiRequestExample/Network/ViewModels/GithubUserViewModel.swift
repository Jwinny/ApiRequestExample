//
//  GetGithubUserViewModel.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

class GithubUserViewModel: ObservableObject {
    @Published var resultUser: GithubUser.Response?
    private let network: NetworkService = NetworkService.shared
    static var instance = GithubUserViewModel()
    func getUser() async {
        let request: GithubUser.Request = GithubUser.Request()
        network.request(request, completion: { response in
            switch response {
            case .success(let data):
                self.resultUser = data
            case .failure(let error):
                print(error)
            }
        })
    }
}
