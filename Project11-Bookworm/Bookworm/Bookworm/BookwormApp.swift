//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Busayo Ajide on 12/9/23.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
