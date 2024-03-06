//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Adriano Vieira on 03/03/24.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var vm = PokemonListViewModel()
    @State private var showFilterSheet = false

    var pokemonList: some View {
        List(vm.list, selection: $vm.selectedID) { pokemon in
            PokemonRow(pokemon: pokemon)
                .onAppear {
                    if pokemon.id == vm.list.last?.id {
                        vm.getList(append: true)
                    }
                }
        }
        .listStyle(.insetGrouped)
        .searchable(text: $vm.searchText, prompt: Text("Search for name or ID"))
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .onChange(of: vm.debouncedSearchText, initial: true) { _, _ in
            vm.getList()
        }
        .onChange(of: vm.selectedType) { _, _ in
            vm.getList()
        }
    }

    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
            pokemonList
                .navigationTitle("Pokedex")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showFilterSheet.toggle()
                        } label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                        }
                    }
                }
        } detail: {
            Group {
                if let selectedPokemon = vm.selectedPokemon {
                    PokemonDetailedView(pokemon: selectedPokemon) { pokemonType in
                        vm.selectedType = pokemonType
                        vm.selectedID = nil
                    }
                } else {
                    Text("Select a pokemon to see its details")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(uiColor: UIColor.secondarySystemBackground))
        }
        .navigationSplitViewStyle(.balanced)
        .tint(vm.selectedPokemonTintColor)
        .sheet(isPresented: $showFilterSheet) {
            PokemonTypeFilterView() { pokemonType in
                vm.selectedType = pokemonType
            }
                .presentationDetents([.medium])
        }
        .alert(
            vm.error?.localizedDescription ?? "Error",
            isPresented: Binding(value: $vm.error)
        ) {}
    }
}

#Preview {
    PokemonListView()
}
