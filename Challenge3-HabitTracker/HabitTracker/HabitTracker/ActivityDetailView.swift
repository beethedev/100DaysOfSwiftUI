//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by Busayo Ajide on 12/1/23.
//

import SwiftUI

struct ActivityDetailView: View {
    
    
    let activity : NewActivity
    
    var body: some View {
        NavigationStack {
            VStack{
                //Text("Description")
                  //  .font(.title.bold())
                
                Text(activity.description)
                    .font(.headline)
                
                Spacer()
                
                Text("Stats")
                    .font(.title2.bold())
                
                Text("You have completed this activity \(activity.completionCount) times." )
                    
                Text("Keep at it!")
                
                Button("Completed activity"){
                    //Button complete action here
                }
                .padding()
                .background(.blue)
                .clipShape(.capsule)
                .foregroundColor(.white)
                
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
    let activities = Activities().items
    
    return ActivityDetailView(activity: activities[0])
}
