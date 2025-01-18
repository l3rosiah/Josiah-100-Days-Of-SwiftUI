//
//  ContentView.swift
//  FriendFace
//
//  Created by Grace Filippi on 1/1/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [Imposter]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.company)
                                    .font(.caption)
                                Text("\(user.friends.count)")
                            }
                            Spacer()
                            Text(user.isActive ? "🟢" : "")
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
//            .navigationDestination(for: Imposter.self) { user in
//                DetailView(user: user)
//            }
            .task {
                if users == [] {
                    await loadData()
                }
            }
        }
    }
    
    func loadData() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Imposter].self, from: data) {
                try? modelContext.delete(model: Imposter.self)
                for user in decodedResponse {
                    modelContext.insert(user)
                }
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Imposter.self)
}
