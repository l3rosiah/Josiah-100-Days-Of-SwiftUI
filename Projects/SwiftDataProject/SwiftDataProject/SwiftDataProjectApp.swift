//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Grace Filippi on 12/26/23.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
