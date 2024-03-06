//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Adriano Vieira on 03/03/24.
//

import SwiftUI

final class PokemonListViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var list: [Pokemon] = []
    @Published var selectedID: Pokemon.ID? = nil
    @Published var error: Error? = nil
    @Published var selectedType: PokemonType? = nil
    @Published var searchText: String = ""
    @Published var debouncedSearchText: String = ""

    init() {
        setupDebounce()
    }

    var selectedPokemon: Pokemon? { return list.first { $0.id == selectedID } }

    var selectedPokemonTintColor: Color? { selectedPokemon?.types.first?.color }

    private func setupDebounce() {
        debouncedSearchText = searchText
        $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .assign(to: &$debouncedSearchText)
    }

    func getList(append: Bool = false) {
        isLoading = true

        PokemonService.shared.getList(
            searchText: searchText.lowercased().trim(),
            id: Int(searchText.trim()) ?? 0,
            type: selectedType?.rawValue ?? "",
            offset: append ? list.count : 0
        ) { [weak self] result in
            self?.isLoading = false

            switch result {
            case let .success(pokemonList):
                if append {
                    self?.list.append(contentsOf: pokemonList)
                } else {
                    self?.list = pokemonList
                }
            case let .failure(error):
                self?.error = error
            }
        }
    }
}
