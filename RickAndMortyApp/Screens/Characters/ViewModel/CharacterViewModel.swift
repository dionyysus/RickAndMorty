//
//  CharacterViewModel.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import Foundation

class CharacterViewModel {
    
    var characters: [Characters] = []
    var filteredCharacters: [Characters] = []
    
    private var apiManager: APIManager?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    
    func fetchCharacters(completion: @escaping () -> Void) {
        APIManager.shared.execute(url: APIManager.shared.charactersURL) { (data: CharacterResponse?) in
            self.characters = data?.results ?? []
            DispatchQueue.main.async {
                completion()
            }
        }
    }

    func search(for query: String) {
        filteredCharacters = characters.filter { character in
            return character.name?.lowercased().contains(query.lowercased()) ?? false
        }
    }

}
