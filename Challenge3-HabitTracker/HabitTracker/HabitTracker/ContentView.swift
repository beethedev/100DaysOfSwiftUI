//
//  ContentView.swift
//  HabitTracker
//
//  Created by Busayo Ajide on 12/1/23.
//

import SwiftUI

struct NewActivity: Codable, Identifiable, Equatable {
    var id = UUID()
    let name : String
    let description : String
    let completionCount : Int
}

let defaultActivities = [
    NewActivity(name: "Running", description: "A simple outdoor run", completionCount: 0),
    NewActivity(name: "Walking", description: "Hiking or Strolling? They both count!", completionCount: 0),
    NewActivity(name: "Dancing", description: "Zumba, Salsa, Electric Slide? If you're dancing it counts!", completionCount: 0)
]

@Observable
class Activities {
    var items = [NewActivity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    
    init() {
        
        
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([NewActivity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
        
        items.append(contentsOf: defaultActivities)
    
    }
}

struct ContentView: View {
    
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    
    var body: some View {
        NavigationStack {

            List{
                ForEach(activities.items){ item in
                    
                    NavigationLink(){
                        ActivityDetailView(activity: item)
                    } label: {
                        HStack{
                            Text(item.name)
                            Spacer()
                            
                            //Text(item.count)
                        }
                    }
                }
            }
            .toolbar{
                Button("Add Activity", systemImage: "plus") {
                    showingAddActivity = true
                }
            }
            .sheet(isPresented: $showingAddActivity){
                    AddActivity(activities: activities)
            }
            .navigationTitle("HabitTracker")
        }
    }
}

#Preview {
    ContentView()
}
