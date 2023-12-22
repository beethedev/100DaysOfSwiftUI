//
//  Bundle-Decodable.swift
//  FriendFace
//
//  Created by Busayo Ajide on 12/17/23.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [User] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 
        
        guard let loaded = try? decoder.decode([User].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
