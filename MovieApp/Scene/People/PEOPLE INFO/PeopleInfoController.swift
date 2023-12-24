//
//  PeopleInfoController.swift
//  MovieApp
//
//  Created by Uzeyir on 19.12.23.
//

import UIKit

class PeopleInfoController: UIViewController {
    
    let viewModel = PeopleInfoViewModel()
    var selectedID = 0
    
    @IBOutlet weak var PeopleInfoCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PeopleInfoCollection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil),forCellWithReuseIdentifier: "TopImageBottomLabelCell")
        
        viewModel.error = { error in
            print(error)
        }
        viewModel.success = {
            self.PeopleInfoCollection.reloadData()
//            print(self.viewModel.InfoItems)
        }
        viewModel.getInfoItems(peopleID: selectedID)
    }
}
extension PeopleInfoController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.InfoItems.count
    }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.InfoItems[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopImageBottomLabelCell", for: indexPath) as! TopImageBottomLabelCell
//        cell.titleLabel.text = item.originalName
        cell.titleLabel.text = "Test"
//        print(item.originalName ?? "Uzeyirrr")
        cell.backgroundColor = .red
//        cell.topImage.loadImage(url: item.profilePath ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        controller.selectedID = viewModel.InfoItems[indexPath.item].id
        navigationController?.show(controller, sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-10, height: 280)
    }
}
//extension PeopleInfoController {
//    
//    func configureViewModel() {
//        viewMOdel.error = { error in
//            print(error)
//        }
//        viewMOdel.success = {
//            self.peopleInfoCollection.reloadData()
////            print(self.viewModel.peopleInfoItems)
//        }
//        viewMOdel.getPeopleInfoItems(peopleID: selectedID)
//    }
//    
//    func configureXib() {
//        peopleInfoCollection.register(UINib(nibName: "TopImageBottomLabelCell", bundle: nil),forCellWithReuseIdentifier: "TopImageBottomLabelCell")
//    }
//}
