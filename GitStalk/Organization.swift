//
//  Organization.swift
//  GitStalk
//
//  Created by Sharat Guduru on 12/5/24.
//

import Foundation

struct Organization: Codable, Identifiable {
    let id: Int
    let login: String
    let description: String?
}

struct Repository: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
}

struct Release: Codable, Identifiable {
    let id: Int
    let name: String
    let body: String?
}

struct PullRequest: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String?
    let state: String
}
