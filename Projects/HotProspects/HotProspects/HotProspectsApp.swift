//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Grace Filippi on 2/22/24.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
