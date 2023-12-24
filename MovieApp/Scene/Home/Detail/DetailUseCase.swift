//
//  DetailUseCase.swift
//  MovieApp
//
//  Created by Uzeyir on 15.12.23.
//

import Foundation


protocol MovieDEtailsProtocol{
    
    func getMovieDetails(endpoint: DetailEndpoint,movieID: Int?, completion: @escaping((Detail?, String?) -> Void))
}

