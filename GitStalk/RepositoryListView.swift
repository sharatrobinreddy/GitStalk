//
//  RepositoryListView.swift
//  GitStalk
//
//  Created by Sharat Guduru on 12/5/24.
//

import SwiftUI

//struct RepositoryListView: View {
//    @ObservedObject var networkManager: NetworkManager
//    let organization: Organization
//    
//    var body: some View {
//        List(networkManager.repositories) { repo in
//            NavigationLink(
//                destination: ReleaseListView(networkManager: networkManager, organization: organization, repository: repo),
//                label: {
//                    VStack(alignment: .leading) {
//                        Text(repo.name).font(.headline)
//                        if let description = repo.description {
//                            Text(description).font(.subheadline).foregroundColor(.secondary)
//                        }
//                    }
//                }
//            )
//        }
//        .navigationTitle(organization.login)
//        .onAppear {
//            networkManager.fetchRepositories(for: organization.login)
//        }
//    }
//}
//
//
//#Preview {
//    RepositoryListView(networkManager: NetworkManager(), organization: .init(id: 0, login: "", description: ""))
//}
