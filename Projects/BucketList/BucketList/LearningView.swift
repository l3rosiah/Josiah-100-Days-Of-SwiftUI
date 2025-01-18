//
//  LearningView.swift
//  BucketList
//
//  Created by Grace Filippi on 1/20/24.
//

//import MapKit
//import SwiftUI
//import LocalAuthentication
//
//struct User: Identifiable, Comparable {
//    static func < (lhs: User, rhs: User) -> Bool {
//        lhs.lastName < rhs.lastName
//    }
//    
//    let id = UUID()
//    var firstName: String
//    var lastName: String
//}

//struct Location: Identifiable {
//    let id = UUID()
//    var name: String
//    var coordinate: CLLocationCoordinate2D
//}

//struct LearningView: View {
//    
//    @State private var isUnlocked = false
//    
//    let users = [
//            User(firstName: "Arnold", lastName: "Rimmer"),
//            User(firstName: "Kristine", lastName: "Kochanski"),
//            User(firstName: "David", lastName: "Lister"),
//    ].sorted()
//    
//    @State private var position = MapCameraPosition.region(
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
//            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//        )
//    )
    
//    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
//        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
//    ]

//        var body: some View {
//            
//            VStack {
//                if isUnlocked {
//                    Text("Unlocked")
//                } else {
//                    Text("Locked")
//                }
//            }
//            .onAppear(perform: authenticate)
//            MapReader { proxy in
//                Map {
//                    ForEach(locations) { location in
//                        Annotation(location.name, coordinate: location.coordinate) {
//                            Text(location.name)
//                                .font(.headline)
//                                .padding()
//                                .background(.blue)
//                                .foregroundStyle(.white)
//                                .clipShape(.capsule)
//                        }
//                        .annotationTitles(.hidden)
//                    }
//                }
//                .onMapCameraChange(frequency: .continuous) { context in
//                    print(context.region)
//                }
//                .onTapGesture { position in
//                    if let coordinate = proxy.convert(position, from: .local) {
//                        print(coordinate)
//                    }
//                }
//            }
//            
//            HStack(spacing: 50) {
//                Button("Paris") {
//                    position = MapCameraPosition.region(
//                        MKCoordinateRegion(
//                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
//                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//                        )
//                    )
//                }
//
//                Button("Tokyo") {
//                    position = MapCameraPosition.region(
//                        MKCoordinateRegion(
//                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
//                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//                        )
//                    )
//                }
//            }
            
//            List(users) { user in
//                Text("\(user.lastName), \(user.firstName)")
//            }
//            Button("Read and write") {
//                let data = Data("Test message".utf8)
//                let url = URL.documentsDirectory.appending(path: "message.txt")
//                
//                do {
//                    try data.write(to: url, options: [.atomic, .completeFileProtection])
//                    let input = try String(contentsOf: url)
//                    print(input)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError?
//        
//        // Check if biometric authentication is possible
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            // if possible, use it
//            let reason = "We need to unlock your data"
//            
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
//                // authentication complete
//                if success {
//                    // successfully authenticated
//                    isUnlocked = true
//                } else {
//                    // there was a problem
//                }
//            }
//        } else {
//            // no biometrics
//        }
//    }
//    
//    }
//
//#Preview {
//    LearningView()
//}
