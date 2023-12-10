//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Busayo Ajide on 12/1/23.
//

import SwiftUI

struct ActivityDetailView: View {
    
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    let activity : NewActivity
    let activities : Activities
    
    var body: some View {
        NavigationStack {
            VStack{
                Text(activity.description)
                    .font(.headline)
                
                Spacer()
                
                Text("Keep at it!")
                
                Button("Completed activity"){
                    
                    var newActivity = activity
                    newActivity.completionCount += 1
                    
                    let index = activities.items.firstIndex(of: activity)
                    
                    // use first index to replace the activity otherwise add to list
                    activities.items[index ?? activities.items.count] = newActivity
                    
                    alertMessage = "You have completed this activity \(newActivity.completionCount) time(s)." 
                    showingAlert.toggle()
                }
                .padding()
                .background(.blue)
                .clipShape(.capsule)
                .foregroundColor(.white)
                .alert("Stats", isPresented: $showingAlert){
                    Button("OK"){}
                }message: {
                    Text(alertMessage)
                }
                
                Spacer()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .navigationTitle(activity.name)
        }
        
    }
}

#Preview {
    let activity = Activities().items
    let activities = Activities()
    
    return ActivityDetailView(activity: activity[0], activities: activities)
}
