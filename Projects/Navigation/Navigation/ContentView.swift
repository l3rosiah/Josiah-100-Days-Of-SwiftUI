//
//  ContentView.swift
//  Navigation
//
//  Created by Grace Filippi on 12/8/23.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView: View {
    @State private var pathStore = PathStore()
    
//    var body: some View {
//        NavigationStack(path: $pathStore.path) {
//            DetailView(number: 0)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i)
//                }
//        }
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
