//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Uzeyir on 12.12.23.
//


import Foundation

enum MovieDetailItemTYPE {
    case description(String)
    case image(String)
    case title(String)
    case info(MovieInfo)
    //    case cast
    
}
struct MovieDetailModel{
    let type: MovieDetailItemTYPE
    //let data: Any?
    
}

struct MovieInfo {
    let rating: String?
    let genres: [Genre]
    let length: String?
    let language: [SpokenLanguage]
}

class DetailViewModel {
    private let manager  = DetailManager()
    var items = [MovieDetailModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getdetails(movieID: Int?) {
        manager.getMovieDetails(endpoint: .movieInfo, movieID: movieID) { data, errorMessage in
            if let errorMessage  {
                self.error?(errorMessage)
            } else if let  data {
                self.items.append(.init(type: .image(data.backdropPath ?? "")))
                self.items.append(.init(type: .title(data.title ?? "")))
                self.items.append(.init(type: .description(data.overview ?? "")))
                self.items.append(.init(type: .info(MovieInfo(
                    rating: "\(data.voteAverage ?? 0.0)",
                    genres: data.genres ?? [],
                    length: "\(data.runtime ?? 0 )",
                    language: data.spokenLanguages ?? [] ))))
                self.success?()
            }
        }
    }
}

