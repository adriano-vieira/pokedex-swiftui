//
//  PokemonDetailedView.swift
//  Pokedex
//
//  Created by Adriano Vieira on 04/03/24.
//

import SwiftUI

struct PokemonDetailedView: View {
    var pokemon: Pokemon
    var size: Double = 128
    @State private var rotation = 0.0
    @State private var showShiny = false
    
    var completion: (PokemonType?) -> Void

    var spriteURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png")
    }

    var spriteShinyURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/\(pokemon.id).png")
    }
    
    var spritesView: some View {
        HStack {
            Button {
                withAnimation {
                    rotation += 360.0
                    showShiny.toggle()
                }
            } label: {
                AsyncImage(url: showShiny ? spriteShinyURL : spriteURL) { image in
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
                .rotation3DEffect(
                    .degrees(rotation),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            }
        }
    }
    
    var typesView: some View {
        HStack {
            ForEach(pokemon.types) { pokemonType in
                PokemonTypeChip(pokemonType: pokemonType)
                    .frame(maxWidth: 100)
                    .onTapGesture {
                        completion(pokemonType)
                    }
            }
        }
    }
    
    var statsView: some View {
        VStack {
            ForEach(pokemon.stats) { pokemonStat in
                HStack {
                    Text(LocalizedStringKey(pokemonStat.name))
                        .frame(minWidth: 120, alignment: .trailing)
                    Text("\(pokemonStat.value)")
                        .frame(minWidth: 120, alignment: .leading)
                        .bold()
                }
            }
        }
        .padding()
    }

    var body: some View {
        ScrollView {
            spritesView
            typesView
            statsView
        }
        .navigationTitle("#\(pokemon.id) \(pokemon.name.capitalized)")
    }
}

#Preview {
    NavigationView {
        PokemonDetailedView(pokemon: Pokemon.sample) { _ in }
    }
}
