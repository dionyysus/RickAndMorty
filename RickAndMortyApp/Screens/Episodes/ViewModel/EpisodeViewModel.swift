//
//  EpisodeViewModel.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 4.09.2023.
//

import Foundation

class EpisodeViewModel {
    
    var episodes: [Episodes] = []
    var filteredEpisodes: [Episodes] = []
    
    private var apiManager: APIManager?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func fetchEpisodes(completion: @escaping () -> Void) {
        APIManager.shared.execute(url: APIManager.shared.episodesURL) { (data: EpisodeResponse?) in
            self.episodes = data?.results ?? []
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func search(for query: String) {
        filteredEpisodes = episodes.filter { episode in
            return episode.name?.lowercased().contains(query.lowercased()) ?? false
        }
    }
    
}
