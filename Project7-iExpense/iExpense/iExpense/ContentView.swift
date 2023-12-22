//
//  ContentView.swift
//  iExpense
//
//  Created by Busayo Ajide on 11/17/23.
//
import SwiftData
import SwiftUI


struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query (sort: \Expenses.amount) var expenses : [Expenses]

    @State private var path = [Expenses]()
    @State private var showingAddExpense = false
    
    @State private var sortOrder = [
        SortDescriptor(\Expenses.amount),
        SortDescriptor(\Expenses.name),
    ]
    
    @State private var showingAll = true
    
    var body: some View {
        NavigationStack(path : $path){
            List {
                Section("Personal Expenses"){
                    ForEach(expenses) { expense in
                        if expense.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(expense.name)
                                        .font(.headline)
                                }
                                Spacer()
                                Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "NGN"))
                                    .foregroundColor(colorStyle(expense.amount))
                                    .bold()
                            }
                        }
                    }
                }
                
                Section("Business Expenses"){
                    ForEach(expenses) { expense in
                        if expense.type == "Business" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(expense.name)
                                            .font(.headline)
                                    }
                                    Spacer()
                                    Text(expense.amount, format: .currency(code: Locale.current.currency?.identifier ?? "NGN"))
                                        .foregroundColor(colorStyle(expense.amount))
                                        .bold()
                                }
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense.toggle()
                    }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\Expenses.name),
                                SortDescriptor(\Expenses.amount),
                            ])
                        
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\Expenses.amount),
                                SortDescriptor(\Expenses.name)
                            ])
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
            
           
        }
        
    }
    
//    init(minimumExpense: Double, sortOrder: [SortDescriptor<Expenses>]) {
//        _expenses = Query(filter: #Predicate<Expenses> { expense in
//            expense.amount >= minimumExpense
//        }, sort: sortOrder)
//    }
//    func removeItems(at offsets: IndexSet) {
//        expenses.items.remove(atOffsets: offsets)
//    }
    
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
