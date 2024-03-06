//
//  StringExtensions.swift
//  Pokedex
//
//  Created by Adriano Vieira on 04/03/24.
//

import Foundation

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func containsInsensitive(_ searchString: String) -> Bool {
        return self.range(
            of: searchString.trim(),
            options: [.caseInsensitive, .diacriticInsensitive]
        ) != nil
    }
}
