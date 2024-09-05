//
//  MovieTwoColumnCell.swift
//  MovieList
//
//  Created by Sahra Dede on 4.09.2024.
//

import Foundation
import UIKit

class MovieTwoColumnCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieYear: UILabel!
    
    func setup(movie:Movie) {
        movieImage.image = movie.image
        movieName.text = movie.title
        movieYear.text = movie.releaseDate 
    }
    
}
