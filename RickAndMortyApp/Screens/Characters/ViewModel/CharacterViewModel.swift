//
//  CharacterViewModel.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import Foundation

class CharacterViewModel {
    
    var characters: [Characters] = [] //all characters
    
    private var apiManager: APIManager?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func fetchMovies(completion: @escaping () -> Void) {
        APIManager.shared.execute(url: APIManager.shared.baseURL) { (data: CharacterResponse?) in
            self.characters = data?.results ?? []
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
