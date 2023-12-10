//
//  Activity.swift
//  HabitTracker
//
//  Created by Busayo Ajide on 12/9/23.
//

//import Foundation
import SwiftUI

struct NewActivity: Codable, Identifiable, Equatable {
    var id = UUID()
    let name : String
    let description : String
    var completionCount : Int
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
