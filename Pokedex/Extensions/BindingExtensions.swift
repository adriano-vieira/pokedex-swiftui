//
//  BindingExtensions.swift
//  Pokedex
//
//  Created by Adriano Vieira on 05/03/24.
//

import SwiftUI

extension Binding where Value == Bool {
    init<T>(value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
