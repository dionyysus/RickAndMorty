//
//  APIManager.swift
//  RickAndMortyApp
//
//  Created by Gizem Coşkun on 29.08.2023.
//

import Foundation

// rick and morty api: https://rickandmortyapi.com/api
//character endpoint: /character
//locations endpoint: /location
//episodes endpoint: /episode

class APIManager {
    
    static let shared = APIManager()
    
//    private var favoriteMoviesArray: [Movie] = []
//    private var categoryMoviesArray: [Genre] = []
//    private var searchedMoviesArray: [Movie] = []
    
    var baseURL = "https://rickandmortyapi.com/api/"
    var characterEndPoint = "/character"

    private init() { }
   
    func execute<T: Decodable>(url: String, completion: @escaping(T?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(decodedData)
                    } catch {
                        print("parsing error \(error)")
                    }
                } else {
                    print("failed fetch data")
                    completion(nil)
                }
            } else {
                print("error data task \(String(describing: error))")
                completion(nil)
            }
        }
        dataTask.resume()
    }
}

