//
//  Expense.swift
//  iExpense
//
//  Created by Busayo Ajide on 12/16/23.
//

import Foundation
import SwiftData

@Model
class Expenses {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
