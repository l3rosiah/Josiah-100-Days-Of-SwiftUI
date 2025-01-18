//
//  Prospect.swift
//  HotProspects
//
//  Created by Grace Filippi on 2/25/24.
//
import SwiftUI
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    let dateAdded: Date
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.dateAdded = .now
    }
}
