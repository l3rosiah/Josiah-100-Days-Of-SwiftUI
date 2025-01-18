//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Grace Filippi on 12/2/23.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
