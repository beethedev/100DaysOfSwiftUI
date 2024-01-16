//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Busayo Ajide on 1/15/24.
//

import Foundation
import CoreLocation
import SwiftUI


extension EditView {
    @Observable
    class ViewModel {
        
//        var location: Location
//        
//        init(location: Location, loadingState: LoadingState = LoadingState.loading, pages: [Page] = [Page]()) {
//            self.location = location
//            self.loadingState = loadingState
//            self.pages = pages
//        }
        
        enum LoadingState {
            case loading, loaded, failed
        }
        
        var loadingState = LoadingState.loading
        var pages = [Page]()
        

        
        func fetchNearbyPlaces(location: Location) async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)

                // we got some data back!
                let items = try JSONDecoder().decode(Result.self, from: data)

                // success – convert the array values to our pages array
                pages = items.query.pages.values.sorted() // { $0.title < $1.title }
                loadingState = .loaded
            } catch {
                // if we're still here it means the request failed somehow
                loadingState = .failed
            }
        }
    }
}
