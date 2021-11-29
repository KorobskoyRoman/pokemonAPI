//
//  NetworkData.swift
//  fetchData
//
//  Created by Roman Korobskoy on 26.11.2021.
//

import Foundation

class NetworkData {
    static let shared = NetworkData()
    
    private init() {}
    
    func fetchPokemons(urlString: String, response: @escaping(PokemonsModel?, Error?) -> Void) {
        NetworkManager.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let pokemons = try JSONDecoder().decode(PokemonsModel.self, from: data)
                    response(pokemons, nil)
                } catch let jsonError {
                    print("error decode \(jsonError)")
                }
            case .failure(let error):
                print("Error requesting \(error.localizedDescription)")
            }
        }
    }
    
    func fetchPokemonDetails(urlString: String, response: @escaping(PokemonModel?, Error?) -> Void) {
        NetworkManager.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let pokemon = try JSONDecoder().decode(PokemonModel.self, from: data)
                    response(pokemon, nil)
                } catch let jsonError{
                    print("error decode \(jsonError)")
                }
            case .failure(let error):
                print("Error requesting \(error.localizedDescription)")
            }
        }
    }
}
