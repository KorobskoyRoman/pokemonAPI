//
//  DetailsPokemonViewController.swift
//  fetchData
//
//  Created by Roman Korobskoy on 27.11.2021.
//

import UIKit

class DetailsPokemonViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pokemonNameLabel: UILabel!
    var pokemon: Pokemons?
    var pokemons = [PokemonsModel]()
    var pokemonModel: PokemonModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPokemon(pokemonName: pokemonModel)
    }
    
    private func setImage(urlString: String?) {
        if let url = urlString {
            NetworkManager.shared.requestData(urlString: url) { result in
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self.imageView.image = image
                case .failure(let error):
                    self.imageView.image = UIImage(systemName: "xmark.app")
                    print("no album logo " + error.localizedDescription)
                }
            }
        } else {
            imageView.image = UIImage(systemName: "xmark.app")
        }
    }
    
    private func fetchPokemon(pokemonName: PokemonModel?) {
        guard let pokemonName = pokemonName else { return }
        let namePokemon = pokemonName.name
        let urlString = "https://pokeapi.co/api/v2/pokemon/\(namePokemon)/"
        NetworkData.shared.fetchPokemonDetails(urlString: urlString) { pokemonModel, error in
            if error == nil {
                guard let pokemonModel = pokemonModel else { return }
                self.pokemonModel = pokemonModel
                self.pokemonNameLabel.text = pokemonModel.name
            } else {
                print(error!.localizedDescription)
            }
        }
    }
}
