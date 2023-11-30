//
//  Mission.swift
//  Moonshot
//
//  Created by Busayo Ajide on 11/23/23.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable {
    struct CrewRole: Codable , Hashable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
