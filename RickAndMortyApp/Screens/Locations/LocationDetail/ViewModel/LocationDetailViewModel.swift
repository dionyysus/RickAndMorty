//
//  LocationDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 5.09.2023.
//

import Foundation

class LocationDetailViewModel {
    
    var location: Locations?
   
    init(location: Locations?) {
        self.location = location
    }
    
    //    func fetchCharacterIds(completion: @escaping () -> Void) {
    //        APIManager.shared.execute(url: APIManager.shared.charactersIDURL) { (data: LocationResponse?) in
    //            self.locations = data?.results ?? []
    //            DispatchQueue.main.async {
    //                completion()
    //            }
    //        }
    //    }
//
//    func fetchLocations(completion: @escaping () -> Void) {
//        APIManager.shared.execute(url: APIManager.shared.locationsURL) { (data: LocationResponse?) in
//            self.location = data?.results ?? []
//            DispatchQueue.main.async {
//                completion()
//            }
//        }
//    }
    
}
