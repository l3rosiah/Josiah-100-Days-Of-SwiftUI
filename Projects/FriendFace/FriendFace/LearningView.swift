////
////  LearningView.swift
////  FriendFace
////
////  Created by Grace Filippi on 1/1/24.
////
//
//import Foundation
//import SwiftUI
//import SwiftData
//
//struct User_Learn: Codable {
//    enum CodingKeys: String, CodingKey {
//        case firstName = "first"
//        case lastName = "last"
//        case age
//    }
//    
//    var firstName: String
//    var lastName: String
//    var age: Int
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.firstName = try container.decode(String.self, forKey: .firstName)
//        self.lastName = try container.decode(String.self, forKey: .lastName)
//        let stringAge = try container.decode(String.self, forKey: .age)
//        self.age = Int(stringAge) ?? 0
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.firstName, forKey: .firstName)
//        try container.encode(self.lastName, forKey: .lastName)
//        try container.encode(String(self.age), forKey: .age)
//    }
//}
//
//struct LearningView: View {
//    @State private var firstName = ""
//    @State private var lastName = ""
//    @State private var age = 0
//    var body: some View {
//        VStack {
//            Text(firstName)
//            Text(lastName)
//            Text(String(age))
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Button("Load Data") {
//                loadData()
//            }
//        }
//        .padding()
//    }
//    func loadData() {
//        let str = """
//        {
//            "first": "Andrew",
//            "last": "Glouberman",
//            "age": "13"
//        }
//        """
//
//        let data = Data(str.utf8)
//        
//        do {
//            let decoder = JSONDecoder()
//            //decoder.keyDecodingStrategy = .convertFromSnakeCase
//            
//            let user = try decoder.decode(User_Learn.self, from: data)
//            print("Hi, I'm \(user.firstName) \(user.lastName)")
//            firstName = user.firstName
//            lastName = user.lastName
//            age = user.age
//        } catch {
//            print("Whoops: \(error.localizedDescription)")
//        }
//    }
//}
//
//#Preview {
//    LearningView()
//}
