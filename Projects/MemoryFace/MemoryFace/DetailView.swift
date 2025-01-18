//
//  DetailView.swift
//  MemoryFace
//
//  Created by Grace Filippi on 2/18/24.
//

import SwiftUI

struct DetailView: View {
    var person: Person
    
    var body: some View {
            VStack {
                Text(person.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical)
                //        Image(person.image)
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .padding()
            .navigationTitle(person.name)
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    DetailView(person: .example)
}
