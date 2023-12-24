//
//  PeopleManager.swift
//  MovieApp
//
//  Created by Uzeyir on 15.12.23.
//

import Foundation

class PeopleManager: PeopleUseCase {
    
    func getPeopleList(pageNumber: Int, completion: @escaping ((People?, String?) -> Void)) {
        let url = Endpoints.popularPeople.rawValue + "?page=\(pageNumber)"
        NetworkManager.request(model: People.self, endpoint: url) { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage.description)
            } else if let data {
                completion(data, nil)
            }
        }
    }
}
