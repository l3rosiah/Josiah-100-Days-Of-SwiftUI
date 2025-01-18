//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Grace Filippi on 12/14/23.
//

import SwiftUI

struct AddHabitView: View {
    
    var habits: Habits
    
    @Environment(\.dismiss) var dismiss
    
    @State private var newHabitTitle = "New Habit"
    @State private var descriptionText = ""
    @State private var consistancy = "Daily"
    @State private var startDate: Date = Date.now
    
    let consistancyValues = ["Daily", "Weekly", "Monthly"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Description") {
                    TextField("Description", text: $descriptionText, axis: .vertical)
                }
                Section("Consistancy") {
                    Picker("Consistancy", selection: $consistancy) {
                        ForEach(consistancyValues, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Start Date") {
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                        .labelsHidden()
                }
            }
            .navigationTitle($newHabitTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let item = Habit(habitTitle: newHabitTitle, description: descriptionText, consistancy: consistancy, startDate: startDate, streak: 0, habitLog: [])
                        habits.items.insert(item, at: 0)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    AddHabitView(habits: Habits())
}
