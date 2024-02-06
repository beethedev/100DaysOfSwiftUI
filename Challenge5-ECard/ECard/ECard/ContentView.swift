//
//  ContentView.swift
//  ECard
//
//  Created by Busayo Ajide on 1/21/24.
//

import MapKit
import SwiftUI
import SwiftData
import PhotosUI

struct ContentView: View {
    @State private var showingAddCard = false
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Card.name) var cards: [Card]
    
//    @State private var cards = Card()
    
    var body: some View {
        NavigationStack{
            VStack{
                if cards.isEmpty {
                    ContentUnavailableView("No ECards Found", systemImage: "person.text.rectangle", description: Text("Add a card to get started"))
                } else {
                    List{
                        ForEach(cards){ item in
                            NavigationLink(){
                                CardDetailView(card: item)
                            } label: {
                                VStack(alignment: .leading){
                                    HStack {
                                        Image(uiImage: UIImage(data: item.photo)!)
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                        Spacer()
                                        Text(item.name)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("ECard")
            .toolbar{
                ToolbarItem{
                    Button("Add card", systemImage: "plus"){
                        showingAddCard = true
                    }
                }
            }
            .sheet(isPresented: $showingAddCard){
                AddCardView()
            }
        }
    }
}

#Preview {
    ContentView()
}
