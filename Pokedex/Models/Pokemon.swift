//
//  Pokemon.swift
//  Pokedex
//
//  Created by Adriano Vieira on 03/03/24.
//

import SwiftUI

struct PokemonStat: Identifiable {
    let name: String
    let value: Int
    
    var id: String { name }
}

enum PokemonType: String, Identifiable, CaseIterable {
    case normal
    case fighting
    case flying
    case poison
    case ground
    case rock
    case bug
    case ghost
    case steel
    case fire
    case water
    case grass
    case electric
    case psychic
    case ice
    case dragon
    case dark
    case fairy
    case unknown
    case shadow

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .normal: "circle.circle.fill"
        case .fighting: "figure.martial.arts"
        case .flying: "bird"
        case .poison: "flask"
        case .ground: "mountain.2.fill"
        case .rock: "stop.circle.fill"
        case .bug: "ladybug"
        case .ghost: "theatermasks"
        case .steel: "hexagon"
        case .fire: "flame"
        case .water: "drop"
        case .grass: "leaf"
        case .electric: "bolt"
        case .psychic: "brain.head.profile"
        case .ice: "snowflake"
        case .dragon: "lizard.fill"
        case .dark: "moon"
        case .fairy: "sparkles"
        case .unknown: "questionmark"
        case .shadow: "moon"
        }
    }

    var color: Color {
        switch self {
        case .normal: .orange
        case .fighting: .red
        case .flying: .blue
        case .poison: .purple
        case .ground: .brown
        case .rock: .gray
        case .bug: .green
        case .ghost: .purple
        case .steel: .gray
        case .fire: .red
        case .water: .blue
        case .grass: .green
        case .electric: .yellow
        case .psychic: .pink
        case .ice: .blue
        case .dragon: .blue
        case .dark: .gray
        case .fairy: .pink
        case .unknown: .gray
        case .shadow: .gray
        }
    }

    var showInList: Bool {
        switch self {
        case .unknown, .shadow: false
        default: true
        }
    }
}

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let stats: [PokemonStat]
    let types: [PokemonType]

    static var sample = Pokemon(
        id: 1,
        name: "bulbasaur",
        stats: [
            PokemonStat(name: "hp", value: 45),
            PokemonStat(name: "attack", value: 49),
            PokemonStat(name: "defense", value: 49),
            PokemonStat(name: "special-attack", value: 65),
            PokemonStat(name: "special-defense", value: 65),
            PokemonStat(name: "speed", value: 45),
        ],
        types: [.grass, .poison]
    )
}
