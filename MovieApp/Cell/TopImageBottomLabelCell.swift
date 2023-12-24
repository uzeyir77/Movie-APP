//
//  TopImageBottomLabelCell.swift
//  MovieApp
//
//  Created by Uzeyir on 06.12.23.
//

import UIKit

protocol TopImageBottomLabelCellProtocol {
    var titleText: String { get }
    var imagePath: String { get }
}

class TopImageBottomLabelCell: UICollectionViewCell {
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topImage.layer.cornerRadius = 16
    }
    
    func configure(data: TopImageBottomLabelCellProtocol) {
        titleLabel.text = data.titleText
        topImage.loadImage(url: data.imagePath)
    }
}
