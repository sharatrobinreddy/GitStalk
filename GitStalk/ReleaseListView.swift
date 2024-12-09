//
//  ReleaseListView.swift
//  GitStalk
//
//  Created by Sharat Guduru on 12/5/24.
//

import SwiftUI

struct ReleaseListView: View {
    @ObservedObject var networkManager: NetworkManager
    let username: String
    let repository: Repository

    var body: some View {
        List {
            Section(header: Text("Releases")) {
                ForEach(networkManager.releases) { release in
                    VStack(alignment: .leading) {
                        Text(release.name).font(.headline)
                        if let body = release.body {
                            Text(body).font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }
            }

            Section(header: Text("Pull Requests")) {
                ForEach(networkManager.pullRequests) { pr in
                    VStack(alignment: .leading) {
                        Text(pr.title).font(.headline)
                        Text("State: \(pr.state)").font(.subheadline).foregroundColor(.secondary)
                        if let body = pr.body {
                            Text(body).font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle(repository.name)
        .onAppear {
            networkManager.fetchReleases(for: username, repo: repository.name)
            networkManager.fetchPullRequests(for: username, repo: repository.name)
        }
    }
}


/*struct ReleaseListView: View {
    @ObservedObject var networkManager: NetworkManager
    let organization: Organization
    let repository: Repository
    
    var body: some View {
        List {
            Section(header: Text("Releases")) {
                ForEach(networkManager.releases) { release in
                    VStack(alignment: .leading) {
                        Text(release.name).font(.headline)
                        if let body = release.body {
                            Text(body).font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }
            }
            
            Section(header: Text("Pull Requests")) {
                ForEach(networkManager.pullRequests) { pr in
                    VStack(alignment: .leading) {
                        Text(pr.title).font(.headline)
                        Text("State: \(pr.state)").font(.subheadline).foregroundColor(.secondary)
                        if let body = pr.body {
                            Text(body).font(.subheadline).foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle(repository.name)
        .onAppear {
            networkManager.fetchReleases(for: organization.login, repo: repository.name)
            networkManager.fetchPullRequests(for: organization.login, repo: repository.name)
        }
    }
}*/

#Preview {
    ReleaseListView(networkManager: NetworkManager(), username:"", repository: .init(id: 1, name: "", description: ""))
}
