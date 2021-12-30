
/*
 
 https://github.com/podium/iOS-Challenge
 
 
 https://podium-fe-challenge-2021.netlify.app/.netlify/functions/graphql
 
 Requirements
 Create a view with the following sections:
 “Movies: Top 5”: Lists the top 5 movies of the data set, according to rating.
 “Browse by Genre”: Lists available genres.
 “Browse by All”: Lists available movies.
 Pressing a movie navigates to a detailed view of the movie.
 Include title, rating, genres, poster, and description
 List the cast
 List the director
 Pressing a genre navigates to a new view showing the category and associated movies.
 The “Browse by All” and Genre view allows the user to sort the list of movies by an order of their choice (i.e. popularity).
 Optional
 Once the required steps are completed and if you'd like to further showcase your skills, you may optionally choose from any of the following:

 Add a search bar that allows searching on 2 or more fields of the movie object.
 Add pagination.
 Load the images of the movie item component so they only appear once the component is visible.
 Add at least one chart or graph representing anything you feel is helpful to the end user.
 Add functionality where clicking on an image preview in the first section expands the image in a modal.
 Add any custom feature you think would benefit the end user.
 
 directive @cacheControl(
   maxAge: Int
   scope: CacheControlScope
 ) on FIELD_DEFINITION | OBJECT | INTERFACE

 type Query {
   movies(
     search: String
     genre: String
     minPopularity: Float
     maxPopularity: Float
     minVoteAverage: Float
     maxVoteAverage: Float
     minBudget: Int
     maxBudget: Int
     limit: Int
     offset: Int
     orderBy: String
     sort: Sort
   ): [Movie]
   movie(id: Int!): Movie
   genres: [String!]!
 }

 type Movie {
   id: Int!
   originalLanguage: String!
   originalTitle: String!
   overview: String!
   popularity: Float!
   posterPath: String
   releaseDate: String!
   voteAverage: Float!
   voteCount: Int!
   title: String!
   budget: Int!
   runtime: Int!
   genres: [String!]!
   cast: [Cast!]!
   director: Director!
 }

 type Cast {
   profilePath: String
   name: String!
   character: String!
   order: Int!
 }

 type Director {
   id: Int!
   name: String!
 }

 enum Sort {
   ASC
   DESC
 }

 enum CacheControlScope {
   PUBLIC
   PRIVATE
 }

 # The `Upload` scalar type represents a file upload.
 scalar Upload

 
 */

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Example for how to use the demo GetMovies query to fetch data from the server.
//    let query = GetMoviesQueryQuery()
//    let query = SearchGenresQuery(genre: "Crime")
//      let query = SearchMoviesQuery() // all movies
      let query = SearchMoviesQuery(genre: "Action", limit: 2)
      
    
    Network.shared.apollo.fetch(query: query) { result in
      switch result {
        case .success(let graphQLResult):
          print("Found \(graphQLResult.data?.movies?.count ?? 0) movies")

          if var movies = graphQLResult.data?.movies?.compactMap({ $0 }) {
              movies.sort { $0.popularity > $1.popularity}
              movies.map { movie in
                  print("movie title:\(movie.title) genre:\(movie.genres) popularity:\(movie.popularity)")
                  print(" poster path:\(movie.posterPath)")
                  print(" overview:\(movie.overview)")
                  print("\n")
              }
          }
          
        case .failure(let error):
          print("Error getting movies: \(error.localizedDescription)")
      }
    }
  }
}
