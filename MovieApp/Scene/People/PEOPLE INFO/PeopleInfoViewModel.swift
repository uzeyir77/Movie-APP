//
//  PeopleInfoViewModel.swift
//  MovieApp
//
//  Created by Uzeyir on 19.12.23.
//

import Foundation

class PeopleInfoViewModel{
    
    var  InfoItems = [InfoCast]()
    var success: (()-> Void)?
    var error: ((String) -> Void)?
    
    
    private let manager = PeopleInfoManager()
    
    func getInfoItems(peopleID: Int){
        manager.getPeopleMovie(peopleID: peopleID) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.InfoItems = data.cast ?? []
                self.success?()
            }
        }
        }
        
        
        
    }
    

