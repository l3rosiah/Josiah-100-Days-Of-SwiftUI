//
//  Habit.swift
//  HabitTracker
//
//  Created by Grace Filippi on 12/14/23.
//

import SwiftUI

struct Habit: Codable, Hashable, Identifiable, Equatable {
    let habitTitle: String
    var id = UUID()
    let description: String
    let consistancy: String
    let startDate: Date
    let streak: Int
    var formattedStartDate: String {
        startDate.formatted(date: .abbreviated, time: .omitted)
    }
    var habitLog: [HabitLog]
    
    
    struct HabitLog: Codable, Hashable, Identifiable {
        let logNumber: Int
        let logTime: Date
        var formattedLogTime: String {
            logTime.formatted(date: .abbreviated, time: .shortened)
        }
        var id = UUID()
    }
}
