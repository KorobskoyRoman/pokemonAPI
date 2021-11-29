//
//  MainViewController.swift
//  fetchData
//
//  Created by Roman Korobskoy on 25.11.2021.
//

import UIKit

class MainViewController: UITableViewController {

    var pokemons = [Pokemons]()
    let url = "https://pokeapi.co/api/v2/pokemon/?offset=100&limit=100"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokemon(pokemonName: "bulbasaur")
    }
    
    private func fetchPokemon(pokemonName: String) {
        let urlString = url
        NetworkData.shared.fetchPokemons(urlString: urlString) { [weak self] pokemonModel, error in
            if error == nil {
                guard let pokemonModel = pokemonModel else { return }
                
                if pokemonModel.results != [] {
                    let sortedPokemons = pokemonModel.results.sorted { firstItem, secondItem in
                        return firstItem.name.compare(secondItem.name) == ComparisonResult.orderedAscending
                    }
                    self?.pokemons = sortedPokemons
                    self?.tableView.reloadData()
                } else {
                    print("Error, no pokemon")
                }
            } else {
                print("error")
            }
        }
    }

    // MARK: - Table view data source
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if let count = pokemons.count {
//            print(count)
//            if indexPath.row == (count - 1)
//        }
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let pokemon = pokemons[indexPath.item]
        cell.configurePokemonCell(pokemon: pokemon)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsPokemonVC = DetailsPokemonViewController()
        let pokemon = pokemons[indexPath.row]
        detailsPokemonVC.pokemon = pokemon
        detailsPokemonVC.title = pokemon.name
        navigationController?.pushViewController(detailsPokemonVC, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowDetails" {
//            let detailsPokemonVC = DetailsPokemonViewController()
//            let pokemon = pokemons[IndexPath.row]
//            detailsPokemonVC.pokemon = pokemon
//            detailsPokemonVC.title = pokemon.name
//        }
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
