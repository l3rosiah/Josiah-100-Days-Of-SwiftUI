//
//  ContentView-ViewModel.swift
//  MemoryFace
//
//  Created by Grace Filippi on 2/18/24.
//

import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        
        let savePath = URL.documentsDirectory.appending(path: "SavedPeople")
        private(set) var people: [Person]
        var showingDetail = false
        var showingAddPerson = false
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                people = try JSONDecoder().decode([Person].self, from: data)
            } catch {
                people = []
            }
        }
        
        func update(person: Person) {
            people.insert(person, at: 0)
            save()
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(people)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }

        
    }
}
