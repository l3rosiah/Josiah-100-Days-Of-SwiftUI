//
//  ContentView.swift
//  MemoryFace
//
//  Created by Grace Filippi on 2/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.people) { person in
                    NavigationLink(value: person) {
                        HStack {
                            Text(person.name)
                                .font(.headline)
                            Spacer()
                        }
                    }
                }
            }
            .navigationDestination(for: Person.self) { person in
                DetailView(person: person)
            }
            .sheet(isPresented: $viewModel.showingAddPerson) {
                AddView(person: .example) {
                    viewModel.update(person: $0)
                }
            }
            .toolbar {
                Button("Add Person", systemImage: "plus") {
                    viewModel.showingAddPerson = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
