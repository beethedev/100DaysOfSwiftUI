//
//  ContentView.swift
//  FriendFace
//
//  Created by Busayo Ajide on 12/17/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
//    let users = Bundle.main.decode("friendface.json") // use to load json from file
//   @State private var users = [User]() // use to load json from web
    
    @Environment(\.modelContext) var modelContext
    @Query var users : [User]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(users, id: \.id) { user in
                    NavigationLink{
                        UserView(user: user)
                    }label:{
                        HStack{
                            Text(user.name)
                            Spacer()
                            Text(user.isActive ? "Active" : "Not Active")
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
            // Uncomment task and func to load json from web
            .task{
                await downloadJson()
                }
        }
    }
    
    func downloadJson() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Invalid URL.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if users.isEmpty {
                guard let decodedResponse = try? decoder.decode([User].self, from: data) else {
                    fatalError("Failed to decode data.")
                }
                try? modelContext.delete(model: User.self)
                for user in decodedResponse {
                    modelContext.insert(user)
                }
//                users = decodedResponse
            }

        } catch {
            fatalError("Failed to decode data.")
        }
    }
}

#Preview {
    ContentView()
}
