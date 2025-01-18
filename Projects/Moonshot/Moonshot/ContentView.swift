//
//  ContentView.swift
//  Moonshot
//
//  Created by Grace Filippi on 12/6/23.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 100)),
        GridItem(.adaptive(minimum: 100))
    ]
    
//    @State private var showingGridView = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink(value: mission) {
                            //                        MissionView(mission: mission, astronauts: astronauts)
                            //                    } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .accessibilityElement()
                            .accessibilityLabel(mission.name)
                            .accessibilityHint(mission.formattedLaunchDate)
                            .accessibilityAddTraits(.isButton)
                            .accessibilityRemoveTraits(.isImage)
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                    .navigationDestination(for: Mission.self) { selection in
                        MissionView(mission: selection, astronauts: astronauts)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
//            .toolbar {
//                Button("Grid") {
//                    showingGridView.toggle()
//                }
//            }
        }
    }
}

#Preview {
    ContentView()
}
