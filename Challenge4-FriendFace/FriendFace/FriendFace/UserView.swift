//
//  UserView.swift
//  FriendFace
//
//  Created by Busayo Ajide on 12/17/23.
//
import SwiftData
import SwiftUI

struct UserView: View {
    @Environment(\.modelContext) var modelContext
    
    let user : User
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 5) {
                
                VStack(alignment: .leading) {
                    Section("Bio") {
                        Text("Status: \(user.isActive ? "Active" : "Not Active")")
                        Text("Join date: \(user.formattedRegisteredDate)")
                        Text("Company: \(user.company)")
                        Text("Email: \(user.email)")
                    }
                }.padding()
                
                VStack(alignment: .leading) {
                    Section("Friends : \(user.friends.count)") {
                        ForEach(user.friends){ friend in
                            Text(friend.name)
                        }
                    }
                }.padding()
                
            }
            .navigationTitle(user.name)
            .padding()
        }
    }
}

#Preview {
    
    let users : [User] =  Bundle.main.decode("friendface.json")
    
    return UserView(user: users[0])
}
