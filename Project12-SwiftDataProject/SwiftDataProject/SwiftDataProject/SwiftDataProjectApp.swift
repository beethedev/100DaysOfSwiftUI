//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Busayo Ajide on 12/13/23.
//
import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
