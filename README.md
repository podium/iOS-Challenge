# iOS Base Project for Podium Take-Home Challenge

## Introduction
We have provided two version of this base project: one using UIKit, one using SwiftUI. They are extremely bare-bones, with a simple example of how to interact with the GraphQL endpoint in the `viewDidLoad` or `.onAppear` of the main view of the app. You can create your own project if you'd like, but we recommend forking this repository and building on top of one of the provided projects to avoid issues with Apollo.

## GraphQL
This base project uses the [Apollo-iOS client](https://github.com/apollographql/apollo-ios) to interact with GraphQL endpoints. You can read about it in much more detail in their documentation, but here is a brief overview from [the documentation](https://www.apollographql.com/docs/ios/) of what it is:

> Apollo iOS is a strongly-typed, caching GraphQL client for native iOS apps written in Swift.
>
> It allows you to execute queries and mutations against a GraphQL server and returns results as query-specific Swift types. This means you don't have to deal with parsing JSON, or passing around dictionaries and making clients cast values to the right type manually. You also don't have to write model types yourself, because these are generated from the GraphQL definitions your UI uses.
>
> As the generated types are query-specific, you're only able to access data you actually specify as part of a query. If you don't ask for a field in a particular query, you won't be able to access the corresponding property on the returned data structure.

### Codegen
As mentioned above, Apollo allows us to generate code based on the queries and mutations we use as defined in `.graphql` files in the project. We have provided you with a rudimentary example of how to get back a list of movies where the only property on each `Movie` object is the `name`. It is called `Movies.graphql` and looks like this:

``` 
query GetMoviesQuery {
  movies {
    title
  }
}
```

As you work on this take-home challenge, you will need to expand upon this to create your own `.graphql` files to customize the data available to display in the app. Each time you build the app, Apollo will automatically run the code necessary to generate code from your `graphql` files. Make sure to build when you make any changes otherwise you won't be able to access those changes in your code. 

You can explore more of what is possible with going to the endpoint in a browser or using a GraphQL client by accessing this endpoint: https://podium-fe-challenge-2021.netlify.app/.netlify/functions/graphql and viewing the schema via what is called `introspection`. For example, if you click on that link, it will open a playground where you can practice using the available queries. On the right side of the screen there are buttons labeled `docs` and `schema`. The docs will tell you definitions of the available model. The schema will tell you what queries are available. 

> **Note**: 
>
> If you change the name of the project, you will need to update the code used in the build script. The specific file you will need to modify is `ApolloCodegen/Sources/ApolloCodeGen/main.swift`. Both UIKit and SwiftUI apps have the same default name of `Movie Challenge`. 