//
//  SearchListUseCase.swift
//  MovieApp
//
//  Created by Uzeyir on 22.12.23.
//

import Foundation

protocol searchListUseCase{
    func getSearchItems(enndpoint:SearchEndpoint, movieKey: String, completion: @escaping((Movie?, String?)->Void))
    
    
    
    
}
