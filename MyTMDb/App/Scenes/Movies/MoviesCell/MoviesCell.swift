//
//  MoviesCell.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 13/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import UIKit

class MoviesCell: UICollectionViewCell {
    
    var moviewName: String = ""
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(with model: MoviesScene.Movies.ViewModel) {
        imageView.image = model.image
    }
}
