//
//  ViewController.swift
//  MovieList
//
//  Created by Sahra Dede on 8.08.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var mycollectionView:UICollectionView!
    let ACCESS_TOKEN =  "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MWU4NDhkZWRmMjYxOTUyNGMzN2NmNzRkZTRhMTg4MCIsIm5iZiI6MTcyNDc0NDMzOC4yODQ2NjcsInN1YiI6IjY2Y2Q3ZmM3MTZkNTUzOGU2OGM0MjBiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zdNLkSyAndjbUKtbHBx6xwEPt41n_5ByOj36nJVfRdA"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mycollectionView.dataSource = self
        mycollectionView.delegate = self
        mycollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        if let flowLayout = mycollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day")
        else {
            print("Invalid URL.")
            return
            
        }
        //Create request
        var request = URLRequest(url: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(ACCESS_TOKEN)", forHTTPHeaderField: "Authorization")
       
        //Create session
        let session = URLSession.shared
        
        //Create fetch task
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error while fetching data: \(error)")
                return
            }
           let httpResponseTemp = response as! HTTPURLResponse
            print(httpResponseTemp.statusCode)
            guard let data = data,
                    let httpResponse = response as?
                HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Status code is not succesfull.")
                return
            }
            
            // Parse the JSON data
            do {
                let decoder = JSONDecoder()
                let myData = try decoder.decode(TrendingMoviesResponseModel.self, from: data)
                let firstMovie = myData.results[0]
                print("Data response movie title: \(firstMovie.title)")
            } catch {
                print("Error decoding JSON: \(error)")
            }
            
        }
        task.resume()
        }
        
        func getMoviesFromApi() async {
            
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day")!
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            let queryItems: [URLQueryItem] = [
                URLQueryItem(name: "language", value: "en-US"),
            ]
            components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
            
            var request = URLRequest(url: components.url!)
            request.httpMethod = "GET"
            request.timeoutInterval = 10
            request.allHTTPHeaderFields = [
                "accept": "application/json",
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MWU4NDhkZWRmMjYxOTUyNGMzN2NmNzRkZTRhMTg4MCIsIm5iZiI6MTcyNDc0NDMzOC4yODQ2NjcsInN1YiI6IjY2Y2Q3ZmM3MTZkNTUzOGU2OGM0MjBiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zdNLkSyAndjbUKtbHBx6xwEPt41n_5ByOj36nJVfRdA"
            ]
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                print(String(decoding: data, as: UTF8.self))
            } catch {
                print("Got Error.")
            }
            
        }
        
    }
    
    
    extension ViewController:UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return movieList.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! MovieCollecitonViewCell
            cell.setup(movie: movieList[indexPath.row])
            print("Movie Number: " + String(indexPath.row) + "Title: " + movieList[indexPath.row].title)
            return cell
        }
    }
    
    extension ViewController:UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width:300.0, height: 300.00)
        }
    }
    
    extension ViewController:UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("Selected:" + movieList[indexPath.row].title)
            
            if let myNavController = self.navigationController {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let detailViewController: DetailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                
                detailViewController.selectedIndex = indexPath.row
                myNavController.pushViewController(detailViewController , animated: true)
            }
        }
    }
    

