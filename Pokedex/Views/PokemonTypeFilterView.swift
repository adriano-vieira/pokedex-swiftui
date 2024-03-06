//
//  PokemonTypeFilterView.swift
//  Pokedex
//
//  Created by Adriano Vieira on 05/03/24.
//

import SwiftUI

struct PokemonTypeFilterView: View {
    @Environment(\.dismiss) private var dismiss
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var selected: PokemonType? = nil
    
    var completion: (PokemonType?) -> Void

    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(PokemonType.allCases) { pokemonType in
                        if pokemonType.showInList {
                            PokemonTypeChip(pokemonType: pokemonType)
                                .overlay {
                                    Capsule()
                                        .stroke(Color(UIColor.label), lineWidth: selected == pokemonType ? 2 : 0)
                                }
                                .onTapGesture {
                                    selected = (selected == pokemonType) ? nil : pokemonType
                                }
                        }
                    }
                }
                Spacer()
                Button {
                    completion(selected)
                    dismiss()
                } label: {
                    Text("Apply")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
            .padding()
            .navigationTitle("Type Filter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonTypeFilterView() { _ in }
}
