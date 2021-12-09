import Foundation
import Apollo

class Network {
  static let shared = Network()
  private static let apiEndpoint = "https://podium-fe-challenge-2021.netlify.app/.netlify/functions/graphql"

  private(set) lazy var apollo = ApolloClient(url: URL(string: Self.apiEndpoint)!)
}
