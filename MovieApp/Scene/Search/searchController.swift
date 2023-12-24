//
//  searchController.swift
//  MovieApp
//
//  Created by Uzeyir on 09.12.23.
//

import UIKit

class searchController: UIViewController, UITextFieldDelegate {
    
    let viewModel = searchViewModel()
    
   
    
    @IBAction func textFieldAsSearch(_ sender: UITextField) {
        if let text = sender.text {
            viewModel.getSearch(movieKey: text)
            tableView.reloadData()
        
        }else {
            viewModel.clearItems()
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self

        tableView.register(UINib(nibName: "searcResultCell", bundle: nil), forCellReuseIdentifier: "searcResultCell")
    }

        
        
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//            if let query = textField.text, !query.isEmpty {
//                viewModel.searchrequest(query: query)
//            }
//            return true
//        }
    }

    extension searchController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.searchedItems.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "searcResultCell", for: indexPath) as! searcResultCell
            cell.searchMovieName.text = viewModel.searchedItems[indexPath.item].title
            cell.descriptionLAbel.text = viewModel.searchedItems[indexPath.item].overview
            cell.searchImage.loadImage(url: viewModel.searchedItems[indexPath.item].backdropPath ?? "")
            cell.IMDBLabel.text = "\(String(describing: viewModel.searchedItems[indexPath.item].voteAverage))"
            return cell
            }
    }
