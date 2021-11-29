//
//  PokemonModel.swift
//  fetchData
//
//  Created by Roman Korobskoy on 27.11.2021.
//

import Foundation

struct PokemonModel: Codable {
    let name: String
    let sprites: Sprites
}

class Sprites: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
    
    init(frontDefault: String) {
        self.frontDefault = frontDefault
    }
}
