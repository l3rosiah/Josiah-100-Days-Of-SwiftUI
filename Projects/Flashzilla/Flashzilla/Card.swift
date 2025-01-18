//
//  Card.swift
//  Flashzilla
//
//  Created by Grace Filippi on 3/18/24.
//

import Foundation

struct Card: Identifiable, Codable {
    var id: UUID = UUID()
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who was the 13th doctor in Doctor Who?", answer: "Jodie Whittaker")
}

