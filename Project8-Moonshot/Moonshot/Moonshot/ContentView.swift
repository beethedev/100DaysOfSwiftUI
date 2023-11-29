//
//  ContentView.swift
//  Moonshot
//
//  Created by Busayo Ajide on 11/21/23.
//

import SwiftUI

let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

let missions: [Mission] = Bundle.main.decode("missions.json")

let columns = [
    GridItem(.adaptive(minimum: 150))
]

struct ContentView: View {
    @State private var showingGrid = false
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    ListView()
                } else {
                    GridView()
                }
            }
            .navigationTitle("Moonshot")
            .toolbar{
                Button{
                    showingGrid.toggle()
                }label: {
                    Image(systemName: "list.bullet")
                }
                .foregroundStyle(.white)
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
