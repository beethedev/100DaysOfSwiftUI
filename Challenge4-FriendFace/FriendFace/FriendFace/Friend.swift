//
//  Friend.swift
//  FriendFace
//
//  Created by Busayo Ajide on 12/18/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Friend: Codable {
    let id : String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
    
    
}
