//
//  PokemonsModel.swift
//  fetchData
//
//  Created by Roman Korobskoy on 25.11.2021.
//

import Foundation

struct PokemonsModel: Codable, Equatable {
    let results: [Pokemons]
}
struct Pokemons: Codable, Equatable {
    let name: String
}
