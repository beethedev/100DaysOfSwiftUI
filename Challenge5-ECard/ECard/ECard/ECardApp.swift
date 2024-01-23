//
//  ECardApp.swift
//  ECard
//
//  Created by Busayo Ajide on 1/21/24.
//

import SwiftUI
import SwiftData

@main
struct ECardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Card.self)
    }
}
