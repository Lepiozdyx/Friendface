//
//  UserViewModel.swift
//  Friendface
//
//  Created by Alex on 19.12.2023.
//

import Foundation

@Observable
final class UserViewModel: ObservableObject {
    var users: [User] = []
    
    private let networkManager = NetworkManager.shared
    
    init() {
        fetchUsersIfNeeded()
    }
    
    private func fetchUsersIfNeeded() {
        if users.isEmpty {
            fetchUsers()
        }
    }
    
    private func fetchUsers() {
        networkManager.fetchInfo { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let user):
                self.users = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
