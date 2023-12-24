//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Uzeyir Mustafayev  on 06.12.23.
//

import Foundation

struct HomeModel {
    let title: String
    let movies: [MovieResult]
}

class HomeViewModel {    
    var items = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getItems() {
        getMovies(title: "Now Playing", endpoint: Endpoints.nowPlayingMovies)
           getMovies(title: "Popular", endpoint: Endpoints.popularMovies)
             getMovies(title: "Top Rated", endpoint: Endpoints.topRatedMovies)
                getMovies(title: "Upcoming", endpoint: Endpoints.upcomingMovies)
    }
    
    func getMovies(title: String, endpoint: Endpoints) {
        NetworkManager.request(model: Movie.self,
                               endpoint: endpoint.rawValue) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: title, movies: data.results ?? []))
                self.success?()
            }
        }
    }
}
