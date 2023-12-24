//
//  PeopleInfoManager.swift
//  MovieApp
//
//  Created by Uzeyir on 19.12.23.
//

import Foundation


class PeopleInfoManager{
    
    
    func getPeopleMovie(peopleID: Int?,completion: @escaping((PeopleInfo?, String? )-> Void )){
        let URL = "\(PeopleInfoEndpoint.PeopleInfo.rawValue)\(peopleID ?? 0)/movie_credits"
        NetworkManager.request(model: PeopleInfo.self, endpoint: URL) { data, errorMessage in
            
            if let errorMessage{
                completion(nil , errorMessage.description)
            } else if let data{
                completion(data , nil)
            }
        }
        
    }
    
    
}
