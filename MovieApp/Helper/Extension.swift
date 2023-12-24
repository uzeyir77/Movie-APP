//
//  Extension.swift
//  MovieApp
//
//  Created by Uzeyir on 06.12.23.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url: String) {
        let path = "\(NetworkHelper.imagePath)\(url)"
        if let finalUrl = URL(string: path) {
            self.kf.setImage(with: finalUrl)
        }
    }
}
