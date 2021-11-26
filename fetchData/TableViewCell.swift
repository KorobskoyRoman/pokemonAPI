//
//  TableViewCell.swift
//  fetchData
//
//  Created by Roman Korobskoy on 25.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var pokemonNameLabel: UILabel!
        
    func configurePokemonCell(pokemon: Pokemons) {
        self.imageView1.image = UIImage(systemName: "xmark.app")
        pokemonNameLabel.text = pokemon.name
    }
}
