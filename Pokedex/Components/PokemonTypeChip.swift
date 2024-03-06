//
//  PokemonTypeChip.swift
//  Pokedex
//
//  Created by Adriano Vieira on 05/03/24.
//

import SwiftUI

struct PokemonTypeChip: View {
    var pokemonType: PokemonType
    
    var body: some View {
        Label(pokemonType.rawValue.capitalized, systemImage: pokemonType.symbol)
            .font(.footnote)
            .bold()
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
            .background(pokemonType.color.gradient)
            .clipShape(Capsule())
    }
}

#Preview {
    PokemonTypeChip(pokemonType: PokemonType.bug)
        .frame(maxWidth: 120)
}
