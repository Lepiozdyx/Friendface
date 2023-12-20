//
//  User.swift
//  Friendface
//
//  Created by Alex on 19.12.2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable, Identifiable, Hashable {
    let id: String
    let name: String
}
