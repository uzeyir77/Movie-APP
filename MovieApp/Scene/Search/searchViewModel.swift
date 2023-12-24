//
//  searchViewModel.swift
//  MovieApp
//
//  Created by Uzeyir on 09.12.23.
//

import Foundation
//import Alamofire

class searchViewModel{
    var searchedItems = [MovieResult]()
    private let manager = SearchManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getSearch(movieKey: String){
        manager.getSearchItems(enndpoint: .search, movieKey: movieKey) { data, errorMessage in
            if let errorMessage{
                self.error?(errorMessage)
            }else if let data{
                self.searchedItems = data.results ?? []
                self.success
            }
        }
        
        
        
    }
    func clearItems() {
        searchedItems.removeAll()
    }
}


