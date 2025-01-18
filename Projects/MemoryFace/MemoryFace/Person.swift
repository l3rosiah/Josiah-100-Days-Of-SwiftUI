//
//  Person.swift
//  MemoryFace
//
//  Created by Grace Filippi on 2/18/24.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

struct Person: Codable, Equatable, Identifiable, Hashable {
    var id = UUID()
    var name: String
    var image: Data
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
    
    #if DEBUG
    //static var example = Person(id: UUID(), name: "Bill Bob", image: )
    #endif
}
