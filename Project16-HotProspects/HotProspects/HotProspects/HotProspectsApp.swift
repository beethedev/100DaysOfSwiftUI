//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Busayo Ajide on 2/5/24.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
