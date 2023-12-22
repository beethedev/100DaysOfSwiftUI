//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Busayo Ajide on 12/14/23.
//
import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var users: [User]
    
    func addSample() {
        let user1 = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)

        modelContext.insert(user1)

        user1.jobs?.append(job1)
        user1.jobs?.append(job2)
    }
    
    var body: some View {
            List(users) { user in
                HStack {
                        Text(user.name)

                        Spacer()

                        Text(String(user.unwrappedJobs.count))
                            .fontWeight(.black)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
            }
            .onAppear(perform: addSample)
        }
    
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: sortOrder)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
