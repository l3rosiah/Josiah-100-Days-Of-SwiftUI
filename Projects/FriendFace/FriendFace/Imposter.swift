//
//  User.swift
//  FriendFace
//
//  Created by Grace Filippi on 1/1/24.
//

import Foundation
import SwiftData

@Model
class Imposter: Codable {
    
    enum CodingKeys: CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends
    }
    
    var id = UUID()
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let stringId = try container.decode(String.self, forKey: .id)
        self.id = UUID(uuidString: stringId) ?? UUID()
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        let stringDate = try container.decode(String.self, forKey: .registered)
        self.registered = try Date(stringDate, strategy: .iso8601)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isActive, forKey: .isActive)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.about, forKey: .about)
        try container.encode(ISO8601DateFormatter().string(from: self.registered), forKey: .registered)
        try container.encode(self.tags, forKey: .tags)
        try container.encode(self.friends, forKey: .friends)
    }
}
