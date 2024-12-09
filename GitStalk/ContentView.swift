//
//  ContentView.swift
//  GitStalk
//
//  Created by Sharat Guduru on 12/5/24.
//

import SwiftUI

/*struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()
    @State private var selectedOrganization: Organization?
    @State private var selectedRepository: Repository?

    var body: some View {
        NavigationView {
            List(networkManager.organizations) { org in
                NavigationLink(
                    destination: RepositoryListView(networkManager: networkManager, organization: org),
                    label: {
                        VStack(alignment: .leading) {
                            Text(org.login).font(.headline)
                            if let description = org.description {
                                Text(description).font(.subheadline).foregroundColor(.secondary)
                            }
                        }
                    }
                )
            }
            .navigationTitle("Organizations")
            .onAppear {
                networkManager.fetchOrganizations()
            }
        }
    }

}*/
struct ContentView: View {
    @StateObject private var networkManager = NetworkManager()
    @State private var username: String = "sharatrobinreddy"
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter GitHub Username", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Fetch Repositories") {
                    if !username.isEmpty {
                        networkManager.fetchRepositories(for: username)
                    }
                }
                .padding()

                List(networkManager.repositories) { repo in
                    NavigationLink(
                        destination: ReleaseListView(networkManager: networkManager, username: username, repository: repo),
                        label: {
                            VStack(alignment: .leading) {
                                Text(repo.name).font(.headline)
                                if let description = repo.description {
                                    Text(description).font(.subheadline).foregroundColor(.secondary)
                                }
                            }
                        }
                    )
                }
            }
            .navigationTitle("GitHub Repositories")
        }
    }
}


#Preview {
    ContentView()
}
