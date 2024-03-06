//
//  PokemonRow.swift
//  Pokedex
//
//  Created by Adriano Vieira on 04/03/24.
//

import SwiftUI

struct PokemonRow: View {
    var pokemon: Pokemon
    var size: Double = 48

    var spriteURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png")
    }

    var body: some View {
        HStack {
            AsyncImage(url: spriteURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size)
            } placeholder: {
                Circle()
                    .fill(.gray)
                    .frame(width: size)
                    .shimmering()
            }
            Text(pokemon.name.capitalized)
                .font(.title3)
                .bold()
            Spacer()
            Text("#\(pokemon.id)")
                .monospacedDigit()
        }
    }
}

#Preview {
    PokemonRow(pokemon: Pokemon.sample)
}
