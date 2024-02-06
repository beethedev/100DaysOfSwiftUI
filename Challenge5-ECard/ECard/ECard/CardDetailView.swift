//
//  CardDetailView.swift
//  ECard
//
//  Created by Busayo Ajide on 1/21/24.
//

import MapKit
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
                    .font(.title2)
                
                Map{
                    Marker(card.name, coordinate: CLLocationCoordinate2D(latitude: card.lat, longitude: card.long))
                }
                
            }
            .padding()
            
            
        }
    }
}

//#Preview {
//    CardDetailView(card: Card)
//}
