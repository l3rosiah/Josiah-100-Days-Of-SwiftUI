//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Grace Filippi on 1/1/24.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Imposter.self)
        .modelContainer(for: Friend.self)
    }
}
