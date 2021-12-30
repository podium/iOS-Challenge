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
    var genres = [String]()
    var currentGenre = ""
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var aSpinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchData()

    }
    
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.keyboardDismissMode = .onDrag
        
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "Search Movie Title"
    }
    
    func fetchData(genre:String = "") {
        
        aSpinner.startAnimating()
        searchBar.isUserInteractionEnabled = false
        
        let query = SearchMoviesQuery(genre: genre, limit: 0)
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                print("Found \(graphQLResult.data?.movies?.count ?? 0) movies")
                
                if var movies = graphQLResult.data?.movies?.compactMap({ $0 }) {
                    movies.sort { $0.popularity > $1.popularity}
                    self.movies = movies
                    let max = movies.count > 5 ? 5 : movies.count
                    self.topFivePopularMovies = Array(movies[0..<max])
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.aSpinner.stopAnimating()
                        self.searchBar.isUserInteractionEnabled = true
                    }
                }
                
                if var genres = graphQLResult.data?.genres.compactMap({ $0 }) {
                    genres.sort()
                    genres.insert("Show All", at: 0)
                    self.genres = genres
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                
            case .failure(let error):
                print("Error getting movies: \(error.localizedDescription)")
            }
        }
        
    }
}

//MARK: TableView Delegate and DataSource
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
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "topMovieCell", for: indexPath)
            cell.textLabel?.text = self.topFivePopularMovies[indexPath.row].title
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
            cell.textLabel?.text = self.movies[indexPath.row].title
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Top Popular \(currentGenre) Movies"
        } else {
            return "All \(currentGenre) Movies"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailTableViewController
        else { return  }
        nextVC.movie = movies[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

//MARK: collectionView Delegate and DataSource
extension MasterTableViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCollectionCell
        
        cell.textLabel.text = genres[indexPath.row]
        cell.backgroundColor = .systemTeal
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchBar.text = ""
        currentGenre = genres[indexPath.row] == "Show All" ? "":genres[indexPath.row]
        if currentGenre == "Show All" {
            fetchData()
        } else {
            fetchData(genre: currentGenre)
        }
        
    }
}

//MARK: SearchBar Delegate
extension MasterTableViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text else {return}
        
        if searchText == "" {
            
        } else {
            var matchMovies = [SearchMoviesQuery.Data.Movie]()
            for movie in movies {
                if movie.title.lowercased().contains(searchText.lowercased()) {
                    matchMovies.append(movie)
                }
            }
            movies = matchMovies
            tableView.reloadData()
        }
        
        
        searchBar.resignFirstResponder()
    }
    
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if searchText == "" {
            fetchData()
            searchBar.resignFirstResponder()
        }
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fetchData()
        searchBar.resignFirstResponder()
    }
}
