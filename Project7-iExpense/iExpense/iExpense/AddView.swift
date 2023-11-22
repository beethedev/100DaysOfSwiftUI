//
//  AddView.swift
//  iExpense
//
//  Created by Busayo Ajide on 11/20/23.
//

import SwiftUI



struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    

    let types = ["Business", "Personal"]
    var expenses: Expenses

        var body: some View {
            NavigationStack {
                Form {
                    TextField("Name", text: $name)

                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }

                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "NGN"))
                        .keyboardType(.decimalPad)
                }
                .navigationTitle("Add new expense")
                .toolbar {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
                
            }
        }
}

#Preview {
    AddView(expenses: Expenses())
}
