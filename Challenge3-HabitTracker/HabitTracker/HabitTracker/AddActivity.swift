//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Busayo Ajide on 12/1/23.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = "Activity Name"
    @State private var description = "Describe activity"
    @State private var count = 0
    
    var activities: Activities
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Description", text: $description)
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        //count+=1
                        let item = NewActivity(name: title, description: description, completionCount: count
                        )
                        
                        activities.items.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
            .navigationTitle($title)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddActivity(activities: Activities())
}
