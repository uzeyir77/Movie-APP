//
//  PeopleController.swift
//  MovieApp
//
//  Created by Uzeyir  on 08.12.23.
//

import UIKit

class PeopleController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = PeopleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        configureUI()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            print(self.viewModel.peopleItems)
            self.collection.reloadData()
        }
        
        viewModel.getPeopleItems()

    }
    
    func configureUI() {
        title = "People"
        collection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil), forCellWithReuseIdentifier: "TopImageBottomLabelCell")
    }
    
}

extension PeopleController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.peopleItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(TopImageBottomLabelCell.self)", for: indexPath) as! TopImageBottomLabelCell
        cell.configure(data: viewModel.peopleItems[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2 - 10, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = viewModel.peopleItems[indexPath.item].id ?? 1
        print(index)
        let controller = storyboard?.instantiateViewController(withIdentifier: "PeopleInfoController") as! PeopleInfoController
        controller.selectedID = index
        navigationController?.show(controller, sender: nil)
        
    }
}
 
