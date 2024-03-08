//
//  ContentView.swift
//  Flashzilla
//
//  Created by Busayo Ajide on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cards = Array<Card>(repeating: .example, count: 10)

    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index]) {
                               withAnimation {
                                   removeCard(at: index)
                               }
                            }
                            .stacked(at: index, in: cards.count)
                    }
                }
            }
        }
    }
    
    func removeCard(at index: Int) {
        cards.remove(at: index)
    }
    
}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}

#Preview {
    ContentView()
}
