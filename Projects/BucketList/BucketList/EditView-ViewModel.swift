//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Grace Filippi on 2/17/24.
//

import Foundation
import SwiftUI

extension EditView {
    @Observable
    class ViewModel {
        
        enum LoadingState {
            case loading, loaded, failed
        }
        
        var location: Location
        
        // TextFields
        var name: String
        var description: String
        
        // Wikipedia info
        var loadingState = LoadingState.loading
        var pages = [Page]()
        
        
        init(location: Location) {
            self.location = location
            name = location.name
            description = location.description
        }
        
        
        func saveLocation() -> Location {
            var newLocation = location
            newLocation.id = UUID()
            newLocation.name = name
            newLocation.description = description
            return newLocation
        }
        
        func fetchNearbyPlaces() async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                // data returned
                let items = try JSONDecoder().decode(Result.self, from: data)
                
                // success
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
                
            } catch {
                // request failed
                loadingState = .failed
            }
        }
    }
}
