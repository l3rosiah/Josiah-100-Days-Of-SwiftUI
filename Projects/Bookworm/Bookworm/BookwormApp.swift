//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Grace Filippi on 12/23/23.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
