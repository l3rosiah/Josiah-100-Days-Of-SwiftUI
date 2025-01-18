//
//  ExpensesView.swift
//  iExpense
//
//  Created by Grace Filippi on 12/31/23.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var expenses: [ExpenseItem]
    
    init(filteredList: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
            filteredList == "All" ? true : expense.type == filteredList
        }, sort: sortOrder)
    }
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    
                    if item.amount < 10.00 {
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundStyle(.blue)
                    } else if item.amount < 100.00 {
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(.green)
                    } else {
                        Text(item.amount, format: .currency(code: "USD"))
                            .foregroundStyle(.red)
                    }
                }
                .accessibilityElement()
                .accessibilityLabel("\(item.name), \(item.amount)")
                .accessibilityHint(item.type)
            }
            .onDelete(perform: removeItems)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
    
}

#Preview {
    ExpensesView(filteredList: "All", sortOrder: [SortDescriptor(\ExpenseItem.name)])
        .modelContainer(for: ExpenseItem.self)
}
