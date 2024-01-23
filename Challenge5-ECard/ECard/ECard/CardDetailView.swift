//
//  CardDetailView.swift
//  ECard
//
//  Created by Busayo Ajide on 1/21/24.
//

import SwiftUI
import SwiftData

struct CardDetailView: View {
    @Environment(\.modelContext) var modelContext

    var card : Card
    
    var body: some View {
        NavigationStack{
            VStack{
                Image(uiImage: UIImage(data: card.photo)!)
                    .resizable()
                    .scaledToFit()
                
                Text(card.name)
                    .font(.title)
            }
            .padding()
        }
    }
}

//#Preview {
//    CardDetailView(card: Card)
//}
