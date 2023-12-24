//
//  MovieListProtocol.swift
//  MovieApp
//
//  Created by Uzeyir on 15.12.23.
//

import Foundation

protocol MovieListUseCase {
    func getMovieList(endpoint: Endpoints, completion: @escaping((Movie?, String?) -> Void))
}
//protocol DetailUseCase{
//    func getMovieDetails(endpoint: Endpoints, completion: ((Detail?, String? )-> Void))
//}
