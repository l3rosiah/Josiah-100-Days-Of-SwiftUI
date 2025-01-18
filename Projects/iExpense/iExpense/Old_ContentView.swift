////
////  ContentView.swift
////  iExpense
////
////  Created by Grace Filippi on 12/2/23.
////
//
//import SwiftUI
//import SwiftData
//
////struct ExpenseItem: Identifiable, Codable {
////    var id = UUID()
////    let name: String
////    let type: String
////    let amount: Double
////}
////
////@Observable
////class Expenses {
////    var items = [ExpenseItem]() {
////        didSet {
////            if let encoded = try? JSONEncoder().encode(items) {
////                UserDefaults.standard.set(encoded, forKey: "Items")
////            }
////        }
////    }
////
////    init() {
////        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
////            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
////                items = decodedItems
////                return
////            }
////        }
////
////        items = []
////    }
////}
//
//struct Old_ContentView: View {
//    @Environment(\.modelContext) var modelContext
//    @Query var expenses: [ExpenseItem]
////    @State private var expenses = Expenses()
////    @State private var showingAddExpense = false
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                Section("Personal") {
//                    ForEach(personalItems(expenseItems: expenses)) { item in
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text(item.name)
//                                    .font(.headline)
//                                Text(item.type)
//                            }
//                            
//                            Spacer()
//                            
//                            
//                            if item.amount < 10.00 {
//                                Text(item.amount, format: .currency(code: "USD"))
//                                    .foregroundStyle(.blue)
//                            } else if item.amount < 100.00 {
//                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                                    .foregroundStyle(.green)
//                            } else {
//                                Text(item.amount, format: .currency(code: "USD"))
//                                    .foregroundStyle(.red)
//                            }
//                        }
//                    }
//                    .onDelete(perform: removeItems)
//                }
//                
////                Section("Business") {
////                    ForEach(businessItems(expenseItems: expenses)) { item in
////                        HStack {
////                            VStack(alignment: .leading) {
////                                Text(item.name)
////                                    .font(.headline)
////                                Text(item.type)
////                            }
////
////                            Spacer()
////
////
////                            if item.amount < 10.00 {
////                                Text(item.amount, format: .currency(code: "USD"))
////                                    .foregroundStyle(.blue)
////                            } else if item.amount < 100.00 {
////                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
////                                    .foregroundStyle(.green)
////                            } else {
////                                Text(item.amount, format: .currency(code: "USD"))
////                                    .foregroundStyle(.red)
////                            }
////                        }
////                    }
////                    .onDelete(perform: removeItems)
////                }
//                
//// ################# SANITY CHECK SECTION ##########################
//                
////                Section("Both for Sanity") {
////                    ForEach(expenses.items) { item in
////                        HStack {
////                            VStack(alignment: .leading) {
////                                Text(item.name)
////                                    .font(.headline)
////                                Text(item.type)
////                            }
////
////                            Spacer()
////
////
////                            if item.amount < 10.00 {
////                                Text(item.amount, format: .currency(code: "USD"))
////                                    .foregroundStyle(.blue)
////                            } else if item.amount < 100.00 {
////                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
////                                    .foregroundStyle(.green)
////                            } else {
////                                Text(item.amount, format: .currency(code: "USD"))
////                                    .foregroundStyle(.red)
////                            }
////                        }
////                    }
////                    .onDelete(perform: removeItems)
////                }
//            }
//            .navigationTitle("iExpense")
//            .toolbar {
//                NavigationLink {
//                    AddView()
//                    } label: {
//                        Button("Add Expense", systemImage: "plus") {
//                            //showingAddExpense = true
//                    }
//                }
//            }
////            .sheet(isPresented: $showingAddExpense) {
////                AddView(expenses: expenses)
////            }
//        }
//    }
//    
//    func removeItems(at offsets: IndexSet) {
//        for offset in offsets {
//            let expense = expenses[offset]
//            modelContext.delete(expense)
//        }
//    }
//    
//    func personalItems(expenseItems: [ExpenseItem]) -> [ExpenseItem] {
//        var personalItems = [ExpenseItem]()
//        for item in expenseItems {
//            if item.type == "Personal" {
//                personalItems.append(item)
//            }
//        }
//        return personalItems
//    }
//    
//    func businessItems(expenseItems: [ExpenseItem]) -> [ExpenseItem] {
//        var businessItems = [ExpenseItem]()
//        for item in expenseItems {
//            if item.type == "Business" {
//                businessItems.append(item)
//            }
//        }
//        return businessItems
//    }
//}
//
//#Preview {
//    ContentView()
//        .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
//}
