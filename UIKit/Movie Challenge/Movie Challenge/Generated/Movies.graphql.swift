// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetMoviesQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetMoviesQuery {
      movies {
        __typename
        id
        title
        popularity
        genres
        posterPath
        overview
      }
    }
    """

  public let operationName: String = "GetMoviesQuery"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movies", type: .list(.object(Movie.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movies: [Movie?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "movies": movies.flatMap { (value: [Movie?]) -> [ResultMap?] in value.map { (value: Movie?) -> ResultMap? in value.flatMap { (value: Movie) -> ResultMap in value.resultMap } } }])
    }

    public var movies: [Movie?]? {
      get {
        return (resultMap["movies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Movie?] in value.map { (value: ResultMap?) -> Movie? in value.flatMap { (value: ResultMap) -> Movie in Movie(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Movie?]) -> [ResultMap?] in value.map { (value: Movie?) -> ResultMap? in value.flatMap { (value: Movie) -> ResultMap in value.resultMap } } }, forKey: "movies")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("popularity", type: .nonNull(.scalar(Double.self))),
          GraphQLField("genres", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("posterPath", type: .scalar(String.self)),
          GraphQLField("overview", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String, popularity: Double, genres: [String], posterPath: String? = nil, overview: String) {
        self.init(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "popularity": popularity, "genres": genres, "posterPath": posterPath, "overview": overview])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var popularity: Double {
        get {
          return resultMap["popularity"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "popularity")
        }
      }

      public var genres: [String] {
        get {
          return resultMap["genres"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "genres")
        }
      }

      public var posterPath: String? {
        get {
          return resultMap["posterPath"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "posterPath")
        }
      }

      public var overview: String {
        get {
          return resultMap["overview"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "overview")
        }
      }
    }
  }
}

public final class SearchIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SearchID {
      movie(id: 775996) {
        __typename
        id
        title
        posterPath
        overview
      }
      genres
    }
    """

  public let operationName: String = "SearchID"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movie", arguments: ["id": 775996], type: .object(Movie.selections)),
        GraphQLField("genres", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movie: Movie? = nil, genres: [String]) {
      self.init(unsafeResultMap: ["__typename": "Query", "movie": movie.flatMap { (value: Movie) -> ResultMap in value.resultMap }, "genres": genres])
    }

    public var movie: Movie? {
      get {
        return (resultMap["movie"] as? ResultMap).flatMap { Movie(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "movie")
      }
    }

    public var genres: [String] {
      get {
        return resultMap["genres"]! as! [String]
      }
      set {
        resultMap.updateValue(newValue, forKey: "genres")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("posterPath", type: .scalar(String.self)),
          GraphQLField("overview", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String, posterPath: String? = nil, overview: String) {
        self.init(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "posterPath": posterPath, "overview": overview])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var posterPath: String? {
        get {
          return resultMap["posterPath"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "posterPath")
        }
      }

      public var overview: String {
        get {
          return resultMap["overview"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "overview")
        }
      }
    }
  }
}

public final class SearchMoviesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SearchMovies($genre: String = "", $limit: Int = 0) {
      movies(genre: $genre, limit: $limit) {
        __typename
        id
        title
        popularity
        voteAverage
        genres
        posterPath
        overview
        director {
          __typename
          name
        }
        cast {
          __typename
          name
          character
        }
      }
      genres
    }
    """

  public let operationName: String = "SearchMovies"

  public var genre: String?
  public var limit: Int?

  public init(genre: String? = nil, limit: Int? = nil) {
    self.genre = genre
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["genre": genre, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("movies", arguments: ["genre": GraphQLVariable("genre"), "limit": GraphQLVariable("limit")], type: .list(.object(Movie.selections))),
        GraphQLField("genres", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(movies: [Movie?]? = nil, genres: [String]) {
      self.init(unsafeResultMap: ["__typename": "Query", "movies": movies.flatMap { (value: [Movie?]) -> [ResultMap?] in value.map { (value: Movie?) -> ResultMap? in value.flatMap { (value: Movie) -> ResultMap in value.resultMap } } }, "genres": genres])
    }

    public var movies: [Movie?]? {
      get {
        return (resultMap["movies"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Movie?] in value.map { (value: ResultMap?) -> Movie? in value.flatMap { (value: ResultMap) -> Movie in Movie(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Movie?]) -> [ResultMap?] in value.map { (value: Movie?) -> ResultMap? in value.flatMap { (value: Movie) -> ResultMap in value.resultMap } } }, forKey: "movies")
      }
    }

    public var genres: [String] {
      get {
        return resultMap["genres"]! as! [String]
      }
      set {
        resultMap.updateValue(newValue, forKey: "genres")
      }
    }

    public struct Movie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Movie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("popularity", type: .nonNull(.scalar(Double.self))),
          GraphQLField("voteAverage", type: .nonNull(.scalar(Double.self))),
          GraphQLField("genres", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("posterPath", type: .scalar(String.self)),
          GraphQLField("overview", type: .nonNull(.scalar(String.self))),
          GraphQLField("director", type: .nonNull(.object(Director.selections))),
          GraphQLField("cast", type: .nonNull(.list(.nonNull(.object(Cast.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: String, popularity: Double, voteAverage: Double, genres: [String], posterPath: String? = nil, overview: String, director: Director, cast: [Cast]) {
        self.init(unsafeResultMap: ["__typename": "Movie", "id": id, "title": title, "popularity": popularity, "voteAverage": voteAverage, "genres": genres, "posterPath": posterPath, "overview": overview, "director": director.resultMap, "cast": cast.map { (value: Cast) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var popularity: Double {
        get {
          return resultMap["popularity"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "popularity")
        }
      }

      public var voteAverage: Double {
        get {
          return resultMap["voteAverage"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "voteAverage")
        }
      }

      public var genres: [String] {
        get {
          return resultMap["genres"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "genres")
        }
      }

      public var posterPath: String? {
        get {
          return resultMap["posterPath"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "posterPath")
        }
      }

      public var overview: String {
        get {
          return resultMap["overview"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "overview")
        }
      }

      public var director: Director {
        get {
          return Director(unsafeResultMap: resultMap["director"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "director")
        }
      }

      public var cast: [Cast] {
        get {
          return (resultMap["cast"] as! [ResultMap]).map { (value: ResultMap) -> Cast in Cast(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Cast) -> ResultMap in value.resultMap }, forKey: "cast")
        }
      }

      public struct Director: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Director"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Director", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Cast: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Cast"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("character", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, character: String) {
          self.init(unsafeResultMap: ["__typename": "Cast", "name": name, "character": character])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var character: String {
          get {
            return resultMap["character"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "character")
          }
        }
      }
    }
  }
}
