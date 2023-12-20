//
//  ContentView.swift
//  Friendface
//
//  Created by Alex on 19.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                NavigationLink(value: user) {
                    HStack {
                        VStack {
                            Text(user.isActive ? "online" : "offline")
                                .font(.caption2)
                            
                            Text(user.isActive ? "🟢" : "🔴")
                                .font(.caption2)
                        }
                        
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Friends")
            .navigationDestination(for: User.self) { selectedUser in
                UserDetailsView(user: selectedUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
