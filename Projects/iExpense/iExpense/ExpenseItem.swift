//
//  Expense.swift
//  iExpense
//
//  Created by Grace Filippi on 12/31/23.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class ExpenseItem {
//    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
//        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
