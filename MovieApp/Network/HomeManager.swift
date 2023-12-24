//
//  HomeManager.swift
//  MovieApp
//
//  Created by Uzeyir on 15.12.23.
//

import Foundation
class HomeManager: MovieListUseCase {
    
    func getMovieList(endpoint: Endpoints, completion: @escaping((Movie?, String?) -> Void)) {
        NetworkManager.request(model: Movie.self,
                               endpoint: endpoint.rawValue) { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
        NetworkManager.request(model: Movie.self, endpoint: endpoint.rawValue, completion: completion)
    }
}
