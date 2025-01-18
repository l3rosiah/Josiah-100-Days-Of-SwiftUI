//
//  EditView.swift
//  HotProspects
//
//  Created by Grace Filippi on 3/1/24.
//

import SwiftUI
import SwiftData

struct EditView: View {
    @Bindable var prospect: Prospect
    
    var body: some View {
        Form {
            TextField("Name", text: $prospect.name)
            TextField("Email", text: $prospect.emailAddress)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Prospect.self, configurations: config)
        let prospect = Prospect(name: "Paul Hudson", emailAddress: "paulhudson@hackingwithswift.com", isContacted: false)
        return EditView(prospect: prospect)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
