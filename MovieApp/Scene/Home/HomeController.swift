//
//  HomeController.swift
//  MovieApp
//
//  Created by Uzeyir  on 06.12.23.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    private let viewModel = HomeViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        configureUI()
        configureViewModel()
    }
    
    @IBAction func passSearchController(_ sender: Any) {
        if let searchController = storyboard?.instantiateViewController(withIdentifier: "searchController") {
                    navigationController?.pushViewController(searchController, animated: true)
                }

        
    }
    func configureUI() {
        title = "Movies"
        collection.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
    
    
    
    
    
    func configureViewModel() {
        viewModel.getItems()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.collection.reloadData()
        }
        viewModel.getItems()
    }
}


extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeCell.self)", for: indexPath) as! HomeCell
        let item = viewModel.items[indexPath.item]
        cell.delegate = self
        cell.configure(title: item.title, movies: item.movies)
        print("jdhbvhwbjfnwke")
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 288)
    }
       }

 
extension HomeController: MovieSelectProtocol {
    func didSelectMovie(at index: Int) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        controller.selectedID = index
        print (" ID: \(index)" )
        navigationController?.show(controller, sender: nil)
    }    
}
