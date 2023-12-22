//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Busayo Ajide on 11/17/23.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expenses.self)
    }
}
