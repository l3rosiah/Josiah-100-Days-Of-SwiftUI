//
//  EditHabitView.swift
//  HabitTracker
//
//  Created by Grace Filippi on 12/15/23.
//

import SwiftUI

struct EditHabitView: View {
    
    var habit: Habit
    var habitsClass: Habits
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Description") {
                    Text(habit.description)
                }
                Section("Started") {
                    HStack {
                        Text(habit.formattedStartDate)
                        Spacer()
                        Text(habit.consistancy)
                    }
                }
                
                Section("Habit Log") {
                    List {
                        ForEach(habit.habitLog) { log in
                            VStack {
                                HStack {
                                    Text("\(log.logNumber)")
                                    Spacer()
                                    Text(log.formattedLogTime)
                                }
                            }
                        }
                    }
                }
            }
                
            Button("Log Activity") {
                let newLogNumber = (habit.habitLog.first?.logNumber ?? 0) + 1
                let newLogDate = Date.now
                
                var updatedHabitLog = habit.habitLog
                
                updatedHabitLog.insert(Habit.HabitLog(logNumber: newLogNumber, logTime: newLogDate), at: 0)
                
                let updatedStreak = calculateStreak(habit: habit)
                
                let updatedHabit = Habit(habitTitle: habit.habitTitle, description: habit.description, consistancy: habit.consistancy, startDate: habit.startDate, streak: updatedStreak, habitLog: updatedHabitLog)
                
                let indexOfThisHabit = habitsClass.items.firstIndex(of: habit)
                
                habitsClass.items[indexOfThisHabit!] = updatedHabit
                
                dismiss()
            }
            .foregroundStyle(.black)
            .frame(width: 200, height: 100)
            .background(.mint)
            .clipShape(.capsule)
            .padding()

            .navigationTitle(habit.habitTitle)
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
        }
    }
    
    func calculateStreak(habit: Habit) -> Int {
        if let lastLog = habit.habitLog.first?.logTime {
            let timePassed = Date.now.timeIntervalSince(lastLog)
            
            if habit.consistancy == "Daily" {
                if Calendar.current.dateComponents([.day], from: lastLog) == Calendar.current.dateComponents([.day], from: Date.now) {
                    return habit.streak
                } else if timePassed > TimeInterval(3600 * 24 * 2) {
                    return 0
                } else {
                    return habit.streak + 1
                }
            } else if habit.consistancy == "Weekly" {
                if Calendar.current.dateComponents([.weekOfYear], from: lastLog) == Calendar.current.dateComponents([.weekOfYear], from: Date.now) {
                    return habit.streak
                } else if timePassed > TimeInterval(3600 * 24 * 14) {
                    return 0
                } else {
                    return habit.streak + 1
                }
            } else {
                if Calendar.current.dateComponents([.month], from: lastLog) == Calendar.current.dateComponents([.month], from: Date.now) {
                    return habit.streak
                } else if timePassed > TimeInterval(3600 * 24 * 60) {
                    return 0
                } else {
                    return habit.streak + 1
                }
            }
        }
        return 0
    }
}

#Preview {
    EditHabitView(habit: Habits().items[0], habitsClass: Habits())
}
