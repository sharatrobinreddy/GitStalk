//
//  NetworkManager.swift
//  GitStalk
//
//  Created by Sharat Guduru on 12/5/24.
//

import Foundation

/*class NetworkManager: ObservableObject {
    private let baseURL = "https://api.github.com"
    private let token = ""

    @Published var organizations: [Organization] = []
    @Published var repositories: [Repository] = []
    @Published var releases: [Release] = []
    @Published var pullRequests: [PullRequest] = []

    func fetchOrganizations() {
        guard let url = URL(string: "\(baseURL)/organizations") else { return }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decodedData = try JSONDecoder().decode([Organization].self, from: data)
                DispatchQueue.main.async {
                    self.organizations = decodedData
                }
            } catch {
                print("Failed to decode organizations: \(error)")
            }
        }.resume()
    }

    func fetchRepositories(for org: String) {
        guard let url = URL(string: "\(baseURL)/orgs/\(org)/repos") else { return }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decodedData = try JSONDecoder().decode([Repository].self, from: data)
                DispatchQueue.main.async {
                    self.repositories = decodedData
                }
            } catch {
                print("Failed to decode repositories: \(error)")
            }
        }.resume()
    }

    func fetchReleases(for org: String, repo: String) {
        guard let url = URL(string: "\(baseURL)/repos/\(org)/\(repo)/releases") else { return }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decodedData = try JSONDecoder().decode([Release].self, from: data)
                DispatchQueue.main.async {
                    self.releases = decodedData
                }
            } catch {
                print("Failed to decode releases: \(error)")
            }
        }.resume()
    }

    func fetchPullRequests(for org: String, repo: String) {
        guard let url = URL(string: "\(baseURL)/repos/\(org)/\(repo)/pulls") else { return }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decodedData = try JSONDecoder().decode([PullRequest].self, from: data)
                DispatchQueue.main.async {
                    self.pullRequests = decodedData
                }
            } catch {
                print("Failed to decode pull requests: \(error)")
            }
        }.resume()
    }
}
*/
class NetworkManager: ObservableObject {
    private let baseURL = "https://api.github.com"
    private let token = "<some token>"

    @Published var repositories: [Repository] = []
    @Published var releases: [Release] = []
    @Published var pullRequests: [PullRequest] = []

    func fetchRepositories(for username: String) {
        guard let url = URL(string: "\(baseURL)/user/repos") else { return }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        request.addValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decodedData = try JSONDecoder().decode([Repository].self, from: data)
                DispatchQueue.main.async {
                    self.repositories = decodedData
                }
            } catch {
                print("Failed to decode repositories: \(error)")
            }
        }.resume()
    }

    func fetchReleases(for username: String, repo: String) {
        guard let url = URL(string: "\(baseURL)/repos/\(username)/\(repo)/releases") else { return }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.github+json", forHTTPHeaderField: "Accept")
        request.addValue("2022-11-28", forHTTPHeaderField: "X-GitHub-Api-Version")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decodedData = try JSONDecoder().decode([Release].self, from: data)
                DispatchQueue.main.async {
                    self.releases = decodedData
                }
            } catch {
                print("Failed to decode releases: \(error)")
            }
        }.resume()
    }

    func fetchPullRequests(for username: String, repo: String) {
        guard let url = URL(string: "\(baseURL)/repos/\(username)/\(repo)/pulls") else { return }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let decodedData = try JSONDecoder().decode([PullRequest].self, from: data)
                DispatchQueue.main.async {
                    self.pullRequests = decodedData
                }
            } catch {
                print("Failed to decode pull requests: \(error)")
            }
        }.resume()
    }
}
