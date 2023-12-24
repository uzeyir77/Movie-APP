//
//  Endpoints.swift
//  MovieApp
//
//  Created by Uzeyir  on 06.12.23.
//

import Foundation

enum Endpoints: String {
    case nowPlayingMovies = "movie/now_playing"
    case popularMovies = "movie/popular"
    case topRatedMovies = "movie/top_rated"
    case upcomingMovies = "movie/upcoming"
    case popularPeople = "person/popular"
    case searchMovies = "search/movie"
    case detailsMovies = "movie/{movie_id}"

}
