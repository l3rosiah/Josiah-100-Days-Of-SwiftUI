//
//  ContentView.swift
//  iExpense
//
//  Created by Grace Filippi on 12/2/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.amount),
    ]
    
    @State private var filteredList = "All"
    
    var body: some View {
        NavigationStack {
            ExpensesView(filteredList: filteredList, sortOrder: sortOrder)
            .navigationTitle("iExpense")
            .toolbar {
                
                Button("Test") {
                    try? modelContext.delete(model: ExpenseItem.self)
                    let expense1 = ExpenseItem(name: "Dinner Out", type: "Personal", amount: 53.28)
                    let expense2 = ExpenseItem(name: "Penis Enlarger", type: "Personal", amount: 420.69)
                    let expense3 = ExpenseItem(name: "Car Rental", type: "Business", amount: 1207.22)
                    let expense4 = ExpenseItem(name: "Scissors", type: "Business", amount: 5.34)
                    
                    modelContext.insert(expense1)
                    modelContext.insert(expense2)
                    modelContext.insert(expense3)
                    modelContext.insert(expense4)
                }
                
                Menu("Filter", systemImage: "list.bullet") {
                    Picker("Filter", selection: $filteredList) {
                        Text("All")
                            .tag("All")
                        Text("Personal")
                            .tag("Personal")
                        Text("Business")
                            .tag("Business")
                    }
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\ExpenseItem.name),
                                SortDescriptor(\ExpenseItem.amount),
                            ])
                        Text("Sort by amount")
                            .tag([
                                SortDescriptor(\ExpenseItem.amount),
                                SortDescriptor(\ExpenseItem.name)
                            ])
                    }
                }
                
                NavigationLink {
                    AddView()
                    } label: {
                        Button("Add Expense", systemImage: "plus") {
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
        .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
}
