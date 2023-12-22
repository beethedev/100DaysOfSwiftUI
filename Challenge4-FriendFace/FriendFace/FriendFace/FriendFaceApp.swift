//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Busayo Ajide on 12/17/23.
//
import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // comment out if not using swift data
        .modelContainer(for: User.self)
    }
}
