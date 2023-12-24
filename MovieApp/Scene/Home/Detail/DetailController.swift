//
//  DetailController.swift
//  MovieApp
//
//  Created by Uzeyir on 12.12.23.
//

import UIKit

class DetailController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    let viewModel = DetailViewModel()
    var selectedID: Int?

    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureUI()
        configureViewModel()
    }
    func configureUI() {
        
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        detailCollectionView.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellWithReuseIdentifier: "DescriptionCell")
        detailCollectionView.register(UINib(nibName: "InfoCell", bundle: nil), forCellWithReuseIdentifier: "InfoCell")
        detailCollectionView.register(UINib(nibName: "NameCell", bundle: nil), forCellWithReuseIdentifier: "NameCell")
        detailCollectionView.register(UINib(nibName: "DetailImageCell", bundle: nil), forCellWithReuseIdentifier: "DetailImageCell")
    }
    func configureViewModel() {
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
        viewModel.success = {
            self.detailCollectionView.reloadData()
            print(self.viewModel.items)
        }
        viewModel.getdetails(movieID: selectedID)
    }
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel.items.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let items = viewModel.items[indexPath.item]
            switch items.type{
            case .title(let title):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NameCell", for: indexPath) as! NameCell
                cell.movieNameDetail.text = title
                return cell
            case .description(let description):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
                cell.detailDescription.text = description
                return cell
            case .image(let imagePath):
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailImageCell", for: indexPath) as! DetailImageCell
//                 if let imagePath {
                    cell.MovieImage.loadImage(url: imagePath)
                
                return cell
            case .info(let info):
                let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: "InfoCell", for: indexPath) as! InfoCell
                cell.languageDetail?.text = "\(info.language)" 
                if let length = info.length {
                    cell.lengthDetail?.text = String(length)
                } else {
                    cell.lengthDetail?.text = "No Data"
                }
                if let rating = info.rating {
                    cell.ratingDetail?.text = String(rating)
                } else {
                    cell.ratingDetail?.text = "No Data"
                }
                return cell
                
            }
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.items[indexPath.item]
        switch item.type {
        case .image:
            return CGSize(width: collectionView.frame.width - 32, height: 240)
        case .title:
            return CGSize(width: collectionView.frame.width - 32, height: 50)
        case .info:
            return CGSize(width: collectionView.frame.width - 32, height: 130)
        case .description:
            return CGSize(width: collectionView.frame.width - 32, height: 144)
//        case .cast:
//            return CGSize(width: collectionView.frame.width - 32, height: 150)
        }
    }
    }


