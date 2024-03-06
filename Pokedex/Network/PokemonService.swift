//
//  PokemonService.swift
//  Pokedex
//
//  Created by Adriano Vieira on 03/03/24.
//

import Apollo
import Foundation
import PokemonAPI

typealias CompletionHandler<T> = (Result<T, Error>) -> Void

class PokemonService {
    // Singleton
    static let shared = PokemonService()
    private init() {}
    
    lazy var apollo = ApolloClient(url: URL(string: "https://beta.pokeapi.co/graphql/v1beta")!)
    
    func getList(
        searchText: String,
        id: Int,
        type: String,
        offset: Int,
        completion: @escaping CompletionHandler<[Pokemon]>
    ) {
        let query = GetPokemonQuery(searchText: searchText, id: id, type: type, offset: offset)
        
        apollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case let .failure(error):
                return completion(.failure(error))
            case let .success(data):
                guard let responseData = data.data?.pokemon_v2_pokemon else {
                    return completion(.failure(PokedexError.noData))
                }
                
                let list: [Pokemon] = responseData.map { pokemon in
                    Pokemon(
                        id: pokemon.id,
                        name: pokemon.name,
                        stats: pokemon.pokemon_v2_pokemonstats.map({ pokemonStat in
                            PokemonStat(
                                name: pokemonStat.pokemon_v2_stat?.name ?? "",
                                value: pokemonStat.base_stat
                            )
                        }),
                        types: pokemon.pokemon_v2_pokemontypes.map({ pokemonType in
                            PokemonType(rawValue: pokemonType.pokemon_v2_type?.name ?? "") ?? .shadow
                        })
                    )
                }
                
                return completion(.success(list))
            }
        }
    }
}

enum PokedexError: Error, LocalizedError {
    case noData
    case customError(message: String?)
    
    var errorDescription: String? {
        switch self {
        case .noData:
            "No data available"
        case .customError(let message):
            message
        }
    }
}
