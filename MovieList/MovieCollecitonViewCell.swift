//
//  MovieCollecitonViewCell.swift
//  MovieList
//
//  Created by Sahra Dede on 20.08.2024.
//

import Foundation
import UIKit

class MovieCollecitonViewCell: UICollectionViewCell {
    
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleButton:UIButton!
    
    func setup(movie:Movie) {
        movieImageView.image = movie.image
        movieImageView.layer.cornerRadius = 80.0
        movieTitleButton.setTitle(movie.title, for: UIControl.State.normal)
        
    }
}
