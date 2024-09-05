//
//  WebViewController.swift
//  MovieList
//
//  Created by Sahra Dede on 22.08.2024.
//

import Foundation
import UIKit
import WebKit

class WebViewController1:UIViewController {
    @IBOutlet var webView: WKWebView!
    
    var selectedMovieIndex = 0
    var selectedMovie:Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Selected movie index: \(selectedMovieIndex)")
        selectedMovie = movieList[selectedMovieIndex]
        loadYoutube(videoURL: selectedMovie.trailer)
        print("Trailer URL: " + selectedMovie.trailer)
    }
    
    func loadYoutube(videoURL:String) {
        if let youtubeURL  =  (URL (string: videoURL) ) {
            webView.load(URLRequest(url:youtubeURL))
        }
        else { return }
        
    }
    @IBAction func closeActionButton(_ sender: Any) {
        self.dismiss(animated: true)
        print("Dissmised!")
    }
}

