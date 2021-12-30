//
//  DetailTableViewController.swift
//  Movie Challenge
//
//  Created by peicheng lee on 12/29/21.
//

import UIKit

class DetailTableViewController : UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var aSpinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var movie : SearchMoviesQuery.Data.Movie! {
        didSet {
//            setupUI()
//            loadData()
        }
    }
    
//    //MARK: data for three tableViewCell
//    // data for overView-cell
//    var overView : String {
//        return movie.overview
//    }
//
//    //data for info-cell
//    var movieTitle : String!
//    var rating : String!
//    var genres : String!
//    var director : String!
    
    //data for cast-cell
    var cast : [SearchMoviesQuery.Data.Movie.Cast] {
        return movie.cast
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        fetchImage()
    }

    func fetchImage() {
        
        aSpinner.style = .large
        aSpinner.hidesWhenStopped = true
        aSpinner.startAnimating()

        guard let url = URL(string: movie.posterPath!) else {print("fail to get url");return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let validData = data,error == nil else {print("fail to download image");return}
            
            DispatchQueue.main.async {
                let downloadedImage = UIImage(data: validData)
                self.imageView.image = downloadedImage
                self.aSpinner.stopAnimating()
            }
        }
        
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


extension DetailTableViewController : UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch section {
            
        case 0 : // overview
            return 1
            
        case 1 : // title,rating,genres,director
            return 4
            
        default : // Cast array
            return cast.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0 : // overview
            let cell = UITableViewCell(style: .default, reuseIdentifier: "overviewCell")
            cell.textLabel?.numberOfLines = 0;
            cell.textLabel?.lineBreakMode = .byWordWrapping
            cell.textLabel?.text = movie.overview
            return cell
            
        case 1 : // title,rating,genres,director
            let cell = UITableViewCell(style: .default, reuseIdentifier: "infoCell")
            switch indexPath.row {

            case 0: // title
                cell.textLabel?.text = "Title: \(movie.title)"
            case 1: // rating
                cell.textLabel?.text = "Rating: \(movie.voteAverage)"

            case 2:
                cell.textLabel?.text = "genres: \(movie.genres)"

            default:
                cell.textLabel?.text = "director: \(movie.director.name)"

            }
            
            cell.textLabel?.adjustsFontSizeToFitWidth = true
            return cell

        default : // Cast array
            let cell = tableView.dequeueReusableCell(withIdentifier: "castCell", for: indexPath)
            cell.textLabel?.text = cast[indexPath.row].name
            return cell
        }

        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            
        case 0 : // overview
            return "Overview:"
            
        case 1 : // title,rating,genres,director
            return "Info:"
            
        default : // Cast array
            return "Cast:"
        }

    }
}
