//
//  Card.swift
//  ECard
//
//  Created by Busayo Ajide on 1/21/24.
//

import Foundation
import SwiftUI
import SwiftData

struct NewCard: Identifiable {
    var picture: Image
    var name: String
    var id =  UUID()
}

//@Observable
@Model
class Card {
//    var items = [NewCard]()
    @Attribute(.externalStorage) var photo: Data
//    var picture: Image
    var name: String
    
    init(photo: Data, name: String) {
//        self.picture = picture
        self.photo = photo
        self.name = name
    }
    
}
