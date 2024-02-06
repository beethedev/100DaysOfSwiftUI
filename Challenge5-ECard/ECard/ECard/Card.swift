//
//  Card.swift
//  ECard
//
//  Created by Busayo Ajide on 1/21/24.
//

import Foundation
import MapKit
import SwiftUI
import SwiftData

struct NewCard: Identifiable {
    var picture: Image
    var name: String
    var id =  UUID()
    var location: CLLocationCoordinate2D
}


@Model
class Card {
    @Attribute(.externalStorage) var photo: Data
    var name: String
    var lat = 51.507222
    var long = -0.1275
    
    init(photo: Data, name: String, lat: Double, long: Double) {
        self.photo = photo
        self.name = name
    }
}
