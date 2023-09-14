//
//  LocationViewModel.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import Foundation

class LocationViewModel {
    
    var locations: [Locations] = []
    var filteredLocations: [Locations] = []
    
    private var apiManager: APIManager?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func fetchLocations(completion: @escaping () -> Void) {
        APIManager.shared.execute(url: APIManager.shared.locationsURL) { (data: LocationResponse?) in
            self.locations = data?.results ?? []
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func search(for query: String) {
        filteredLocations = locations.filter { location in
            return location.name?.lowercased().contains(query.lowercased()) ?? false
        }
    }
    
}
