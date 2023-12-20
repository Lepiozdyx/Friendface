//
//  UserDetailsView.swift
//  Friendface
//
//  Created by Alex on 19.12.2023.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        
        List {
            Section("Personal info") {
                HStack {
                    Text("Age: \(user.age)")
                    Spacer()
                    Text("Company: \(user.company)")
                }
                
                Label(user.email, systemImage: "envelope")
                Label(user.address, systemImage: "house")
                Label(user.about, systemImage: "person.text.rectangle")
            }

            Section("Registration date") {
                Text("\(user.registered.formatted(date: .long, time: .shortened))")
            }
            
            Section("Tags") {
                ForEach(user.tags, id: \.self) {
                    Text($0)
                }
            }
            
            Section("Friends") {
                ForEach(user.friends, id: \.self) {
                    Text($0.name)
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    UserDetailsView(user: User(id: "123-123", isActive: true, name: "Alford Rodriguez", age: 12, company: "Netflix", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street", about: "Occaecat consequat elit aliquip magna laboris dolore laboris", registered: Date.now, tags: ["cillum", "consequat"], friends: [Friend(id: "1", name: "Berger Robertson"), Friend(id: "2", name: "Jewel Sexton")]))
}
