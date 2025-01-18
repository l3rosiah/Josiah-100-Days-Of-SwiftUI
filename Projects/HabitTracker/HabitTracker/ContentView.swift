//
//  ContentView.swift
//  HabitTracker
//
//  Created by Grace Filippi on 12/13/23.
//

import SwiftUI

@Observable
class Habits {
    var items = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                items = decodedHabits
                return
            }
        }
        items = []
        //items = [Habit(habitTitle: "Testing Habit", description: "This is a great habit to pursue and will bring you great fulfillment", consistancy: "Daily", startDate: Date.now.addingTimeInterval(TimeInterval(-3600 * 24 * 2)), streak: 0, habitLog: [Habit.HabitLog(logNumber: 1, logTime: Date.now.addingTimeInterval(TimeInterval(-3600 * 24 * 1)))])]
    }
}

struct ContentView: View {
    
    @State private var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.items) { habit in
                    NavigationLink {
                        EditHabitView(habit: habit, habitsClass: habits)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.habitTitle)
                                    .font(.headline)
                                Text("Last: \(habit.habitLog.first?.formattedLogTime ?? "N/A")")
                                    .font(.caption)
                            }
                            Spacer()
                            Text("\(habit.streak)🔥")
                        }
                    }
                }
                .onDelete(perform: removeItems)
                //                .navigationDestination(for: Habit.self) { selection in
                //                    EditHabitView(habit: selection)
                //                }
            }
            .navigationTitle("Habits")
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Add Habit", systemImage: "plus") {
                    showingAddHabit = true
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
