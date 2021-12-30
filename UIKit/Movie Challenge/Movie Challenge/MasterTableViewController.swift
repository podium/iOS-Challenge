//
//  MasterTableViewController.swift
//  Movie Challenge
//
//  Created by peicheng lee on 12/29/21.
//

import UIKit

class MasterTableViewController : UIViewController {
    
    var movies = [SearchMoviesQuery.Data.Movie]()
    var topFivePopularMovies = [SearchMoviesQuery.Data.Movie]()

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchData()

    }
    
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func fetchData() {
              let query = SearchMoviesQuery() // all movies
//              let query = SearchMoviesQuery(genre: "Action", limit: 2)
              
            
            Network.shared.apollo.fetch(query: query) { result in
              switch result {
                case .success(let graphQLResult):
                  print("Found \(graphQLResult.data?.movies?.count ?? 0) movies")

                  if var movies = graphQLResult.data?.movies?.compactMap({ $0 }) {
                      movies.sort { $0.popularity > $1.popularity}
                      movies.map { movie in
//                          print("movie title:\(movie.title) genre:\(movie.genres) popularity:\(movie.popularity)")
//                          print(" poster path:\(movie.posterPath)")
//                          print(" overview:\(movie.overview)")
//                          print("\n")
                      }
                      
                      self.movies = movies
//                      let rangeTop5 = movies.startIndex ..< movies.index(movies.startIndex, offsetBy: 5)
//                      self.topFivePopularMovies = movies[rangeTop5]
                      self.topFivePopularMovies = Array(movies[0...4])
                      self.tableView.reloadData()
                  }
                  
                case .failure(let error):
                  print("Error getting movies: \(error.localizedDescription)")
              }
            }

    }
}


extension MasterTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0 :
            return topFivePopularMovies.count
        default :
            return movies.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0 :
            print("indexPath:\(indexPath),self.movies:\(self.movies)")
            
            //            let cell = tableView.dequeueReusableCell(withIdentifier: "topMovieCell", for: indexPath)
            let cell = tableView.dequeueReusableCell(withIdentifier: "topMovieCell")!
            
            cell.textLabel?.text = self.topFivePopularMovies[indexPath.row].title
            tableView.rowHeight = 80
            return cell
            
        default:
            print("indexPath:\(indexPath),self.movies.count:\(self.movies.count)")
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
            cell.textLabel?.text = self.movies[indexPath.row].title
            tableView.rowHeight = 40
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Top 5 Popular Movies"
        } else {
            return "All Movies"
        }
    }
}
