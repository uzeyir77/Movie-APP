//
//  SearchManager.swift
//  MovieApp
//
//  Created by Uzeyir on 22.12.23.
//

import Foundation


class SearchManager: searchListUseCase {

    
    func getSearchItems(enndpoint: SearchEndpoint, movieKey: String, completion: @escaping((Movie?, String?) -> Void)) {
        let param: [String: Any] = ["query": movieKey]
        NetworkManager.request(model: Movie.self, endpoint: enndpoint.rawValue) { data, errorMessage in
            if let errorMessage{
                completion(nil, errorMessage)
            }else if let data {
                completion(data, nil)
                
            }
        }
    }

    
    
    }

