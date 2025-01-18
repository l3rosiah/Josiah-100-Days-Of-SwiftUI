//
//  LearningView.swift
//  Bookworm
//
//  Created by Grace Filippi on 12/23/23.
//
//
//import SwiftUI
//
//struct ContentView2: View {
//    @AppStorage("notes") private var notes = ""
//    
//    var body: some View {
//        NavigationStack {
//                TextEditor(text: $notes)
//                    .navigationTitle("Notes")
//                    .padding()
//        }
//    }
//}
//
//struct PushButton: View {
//    let title: String
//    @Binding var isOn: Bool
//    
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//    
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
//        .foregroundStyle(.white)
//        .clipShape(.capsule)
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}
//
//#Preview {
//    ContentView2()
//}
