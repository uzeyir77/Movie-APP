//
//  searcResultCell.swift
//  MovieApp
//
//  Created by Uzeyir on 09.12.23.
//

import UIKit

class searcResultCell: UITableViewCell {
    
    
    
 let searchImageURL = "https://image.tmdb.org/t/p/original/"

    
    @IBOutlet weak var searchImage: UIImageView!
    
    @IBOutlet weak var searchMovieName: UILabel!
    
    @IBOutlet weak var IMDBLabel: UILabel!
    
    @IBOutlet weak var descriptionLAbel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
//    func fillCell(searchMovieName: String, IMDBLabel: String, descriptionLabel: String, searchImage: String) {
//        self.searchMovieName.text = searchMovieName
//        self.IMDBLabel.text = IMDBLabel
//        self.descriptionLAbel.text = descriptionLabel
//        if let imageURL = URL(string: searchImageURL) {
//                    let placeholderImage = UIImage(named: "placeholderImage")
//                    self.searchImage.kf.setImage(with: imageURL, placeholder: placeholderImage)
//                }
        
        
        
        
    }

