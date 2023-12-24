//
//  DetailManager.swift
//  MovieApp
//
//  Created by Uzeyir on 15.12.23.
//

import Foundation

class DetailManager: MovieDEtailsProtocol {
    func getMovieDetails(endpoint: DetailEndpoint, movieID: Int?, completion: @escaping ((Detail?, String?) -> Void)) {
        NetworkManager.request(model: Detail.self, endpoint: "\(endpoint.rawValue)\(movieID ?? 0)")  { data, errorMessage in
            if let  errorMessage {
                completion(nil, errorMessage.description)
            }else if let data{
                completion(data , nil)
            }
        }
    }
    }
    



