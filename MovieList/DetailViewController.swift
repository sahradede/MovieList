//
//  DetailViewController.swift
//  MovieList
//
//  Created by Sahra Dede on 21.08.2024.
//

import Foundation
import UIKit

class DetailViewController:UIViewController {
    var selectedIndex:Int = 0
    @IBOutlet weak var movieStartButton: UIButton!
    @IBOutlet weak var movieStartButton2: UIButton!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet var movieName:UILabel!
    @IBOutlet var duration:UILabel!
    @IBOutlet var ratingLabel:UILabel!
    @IBOutlet var releaseDate: UILabel!
    @IBOutlet var genre: UILabel!
    @IBOutlet var desc: UITextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Selected Index: \(selectedIndex)")
       
        let movie:Movie = movieList[selectedIndex]
        print("Selected Movie: " + movie.title)
       
        if let temp = movie.image {
            movieImageView.image = temp
        }
        if let temp = movie.title {
            movieName.text = temp
        }
        
        if let temp = movie.duration {
            duration.text = String(temp) + " Minutes"
        }
        if let temp = movie.rating {
            ratingLabel.text = String(temp)
        }
        if let temp = movie.releaseDate {
            releaseDate.text = String(temp)
        }
        if let temp = movie.genre {
            genre.text = String(temp)
        }
        if let temp = movie.desc {
            desc.text = String(temp)
        }
    }
    @IBAction func movieStartButtonTap1(_ sender: Any) {
        loadWebView()
    }
    @IBAction func movieStarButtonTap2(_ sender: Any) {
        loadWebView()
    }
    
    func loadWebView() {
        
       
            let storyBoard = UIStoryboard(name:"Main", bundle: nil)
            let webViewController:WebViewController1 = storyBoard.instantiateViewController(withIdentifier: "WebViewController1") as! WebViewController1
            
            webViewController.selectedMovieIndex = selectedIndex
            webViewController.modalPresentationStyle = .popover
            self.present(webViewController, animated: true)
            
        
    }
}



