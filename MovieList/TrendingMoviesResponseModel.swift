//
//  TrendingMoviesResponseModel.swift
//  MovieList
//
//  Created by Sahra Dede on 27.08.2024.
//

import Foundation

struct TrendingMoviesResponseModel : Codable {
    let page: Int
    let results:[MovieResponse]
}
            
struct MovieResponse: Codable {
    let id: Int
    let title:String
    let overwiev: String
    let posterp_path: String
    let release_date: String
    let vote_average:Double
    
    
}
