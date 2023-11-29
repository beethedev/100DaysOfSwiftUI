//
//  ContentView.swift
//  iExpense
//
//  Created by Busayo Ajide on 11/17/23.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct ContentView: View {

    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal Expenses"){
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    //Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "NGN"))
                                    .foregroundColor(colorStyle(item.amount))
                                    .bold()
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                Section("Business Expenses"){
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    //Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "NGN"))
                                    .foregroundColor(colorStyle(item.amount))
                                    .bold()
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink("Add Expense") {
                        AddView(expenses: expenses)
                    }
                }
            }
        //.sheet(isPresented: $showingAddExpense) {
          //  AddView(expenses: expenses)
        //}
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func colorStyle(_ amount:Double) -> Color{
        if amount <= 10 {
            return .green
        } else if amount <= 100 {
            return .blue
        } else {
            return .red
        }
    }
}

#Preview {
    ContentView()
}
