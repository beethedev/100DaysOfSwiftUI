//
//  ContentView.swift
//  HabitTracker
//
//  Created by Busayo Ajide on 12/1/23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    
    var body: some View {
        NavigationStack {

            List{
                ForEach(activities.items){ item in
                    
                    NavigationLink(){
                        ActivityDetailView(activity: item, activities: activities)
                    } label: {
                        HStack{
                            Text(item.name)
                            Spacer()
                            
                            Text("\(item.completionCount)")
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
