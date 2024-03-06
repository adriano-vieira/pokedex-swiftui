// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPokemonQuery: GraphQLQuery {
  public static let operationName: String = "GetPokemon"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetPokemon($searchText: String!, $id: Int!, $type: String!, $offset: Int!) { pokemon_v2_pokemon( limit: 20 offset: $offset where: { _or: [{ name: { _regex: $searchText } }, { id: { _eq: $id } }] pokemon_v2_pokemontypes: { pokemon_v2_type: { name: { _regex: $type } } } } order_by: { id: asc } ) { __typename id name height weight pokemon_v2_pokemontypes { __typename pokemon_v2_type { __typename name } } pokemon_v2_pokemonstats { __typename base_stat pokemon_v2_stat { __typename name } } } }"#
    ))

  public var searchText: String
  public var id: Int
  public var type: String
  public var offset: Int

  public init(
    searchText: String,
    id: Int,
    type: String,
    offset: Int
  ) {
    self.searchText = searchText
    self.id = id
    self.type = type
    self.offset = offset
  }

  public var __variables: Variables? { [
    "searchText": searchText,
    "id": id,
    "type": type,
    "offset": offset
  ] }

  public struct Data: PokemonAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PokemonAPI.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon_v2_pokemon", [Pokemon_v2_pokemon].self, arguments: [
        "limit": 20,
        "offset": .variable("offset"),
        "where": [
          "_or": [["name": ["_regex": .variable("searchText")]], ["id": ["_eq": .variable("id")]]],
          "pokemon_v2_pokemontypes": ["pokemon_v2_type": ["name": ["_regex": .variable("type")]]]
        ],
        "order_by": ["id": "asc"]
      ]),
    ] }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemon_v2_pokemon: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemon"] }

    /// Pokemon_v2_pokemon
    ///
    /// Parent Type: `Pokemon_v2_pokemon`
    public struct Pokemon_v2_pokemon: PokemonAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PokemonAPI.Objects.Pokemon_v2_pokemon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String.self),
        .field("height", Int?.self),
        .field("weight", Int?.self),
        .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
        .field("pokemon_v2_pokemonstats", [Pokemon_v2_pokemonstat].self),
      ] }

      public var id: Int { __data["id"] }
      public var name: String { __data["name"] }
      public var height: Int? { __data["height"] }
      public var weight: Int? { __data["weight"] }
      /// An array relationship
      public var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }
      /// An array relationship
      public var pokemon_v2_pokemonstats: [Pokemon_v2_pokemonstat] { __data["pokemon_v2_pokemonstats"] }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemontype
      ///
      /// Parent Type: `Pokemon_v2_pokemontype`
      public struct Pokemon_v2_pokemontype: PokemonAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokemonAPI.Objects.Pokemon_v2_pokemontype }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pokemon_v2_type", Pokemon_v2_type?.self),
        ] }

        /// An object relationship
        public var pokemon_v2_type: Pokemon_v2_type? { __data["pokemon_v2_type"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemontype.Pokemon_v2_type
        ///
        /// Parent Type: `Pokemon_v2_type`
        public struct Pokemon_v2_type: PokemonAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PokemonAPI.Objects.Pokemon_v2_type }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonstat
      ///
      /// Parent Type: `Pokemon_v2_pokemonstat`
      public struct Pokemon_v2_pokemonstat: PokemonAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokemonAPI.Objects.Pokemon_v2_pokemonstat }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("base_stat", Int.self),
          .field("pokemon_v2_stat", Pokemon_v2_stat?.self),
        ] }

        public var base_stat: Int { __data["base_stat"] }
        /// An object relationship
        public var pokemon_v2_stat: Pokemon_v2_stat? { __data["pokemon_v2_stat"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonstat.Pokemon_v2_stat
        ///
        /// Parent Type: `Pokemon_v2_stat`
        public struct Pokemon_v2_stat: PokemonAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PokemonAPI.Objects.Pokemon_v2_stat }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }
    }
  }
}
