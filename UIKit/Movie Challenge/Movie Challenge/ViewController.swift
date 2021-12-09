import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Example for how to use the demo GetMovies query to fetch data from the server.
    let query = GetMoviesQueryQuery()
    Network.shared.apollo.fetch(query: query) { result in
      switch result {
        case .success(let graphQLResult):
          print("Found \(graphQLResult.data?.movies?.count ?? 0) movies")

        case .failure(let error):
          print("Error getting movies: \(error.localizedDescription)")
      }
    }
  }
}
