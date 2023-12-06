//
//  ContentView.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import SwiftUI

struct HomeView: View {
    @State var description: String = ""
    @State var searchUser: String = ""
    @State var userName: String?
    private var user: GithubUser.Response? {
        githubViewModel.resultUser
    }
    @ObservedObject var githubViewModel: GithubUserViewModel = GithubUserViewModel.instance
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                TextField("Digite o nome do usuario", text: $searchUser)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        KeysService.set(self.searchUser, for: .username)
                        Task {
                            do {
                                await githubViewModel.getUser()
                            }
                        }
                        searchUser = ""
                    }
                Button("Pesquisar") {
                    KeysService.set(self.searchUser, for: .username)
                    Task {
                        do {
                            await githubViewModel.getUser()
                        }
                    }
                    searchUser = ""
                }
                .buttonStyle(.borderedProminent)
            }
            AsyncImage(url: URL(string:user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            }
        placeholder: {
            Circle()
                .foregroundStyle(.gray)
                .overlay {
                    Image(systemName: "questionmark")
                        .font(.largeTitle)
                }
        }
        .frame(width: 120)
            Text(user?.login ?? "Username")
                .bold()
                .font(.title3)
            Text(user?.bio ?? "Empty Bio")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
