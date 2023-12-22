//
//  AddView.swift
//  iExpense
//
//  Created by Busayo Ajide on 11/20/23.
//
import SwiftData
import SwiftUI



struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @Query var expenses : [Expenses]
    
    @State private var name = ""
    @State private var title = "Expense name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    

    let types = ["Business", "Personal"]

        var body: some View {
            NavigationStack {
                Form{
                    TextField("Name", text: $name)
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "NGN"))
                        .keyboardType(.decimalPad)
                }
                .navigationTitle("Add Expense")
                .navigationBarBackButtonHidden()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save") {
                            let expense = Expenses(name: name, type: type, amount: amount)
                            modelContext.insert(expense)
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
                
            }
        }
}

#Preview {
    AddView()
}
