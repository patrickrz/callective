//
//  TableViewController.swift
//  MDBProject2
//
//  Created by Kanu Grover on 9/30/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, SendingDataDelegate, UISplitViewControllerDelegate {
    
    @IBAction func showTable(_ sender: Any) {
        performSegue(withIdentifier: "popover", sender: nil)
    }
    
    var filteredPokemon = [Pokemon]()
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var areBoundsEmpty: Bool {
        return (lowerBounds == [0, 0, 0, 0, 0, 0]) && (upperBounds == [999, 999, 999, 999, 999, 999])
    }
    
    var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty || !areBoundsEmpty || searchBarScopeIsFiltering)
    }
    
    var lowerBounds = [0, 0, 0, 0, 0, 0]
    var upperBounds = [999, 999, 999, 999, 999, 999]
    
    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Table view data source
    
    let pokemonArray = PokemonGenerator.getPokemonArray()
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    func sendBoundstoPreviousVC(lower: [Int], upper: [Int]) {
        lowerBounds = lower
        upperBounds = upper
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredPokemon.count
        }
        return PokemonGenerator.getPokemonArray().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        let currentPokemon: Pokemon
        
        if isFiltering {
            currentPokemon = filteredPokemon[indexPath.row]
        } else {
            currentPokemon = pokemonArray[indexPath.row]
        }
        
        cell.name.text = currentPokemon.name
        cell.ID.text = String(currentPokemon.id)
        let url = URL(string: currentPokemon.imageUrl)
        cell.imageView?.image = UIImage(data: try! Data(contentsOf: url!))
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "showPokemonDetail", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPokemonDetail" {
            if let destination = segue.destination as? PokemonViewController {
                    let pokemon: Pokemon
                    if isFiltering {
                        pokemon = filteredPokemon[tableView.indexPathForSelectedRow!.row]
                    } else {
                        pokemon = pokemonArray[tableView.indexPathForSelectedRow!.row]
                    }
                    destination.name1 = pokemon.name
                    destination.id1 = String(pokemon.id)
                    destination.speed1 = "Spd     " + String(pokemon.speed)
                    destination.attack1 = "Atk     " + String(pokemon.attack)
                    destination.hp1 = "HP     " + String(pokemon.health)
                    destination.spAttack1 = "SpAtk     " + String(pokemon.specialAttack)
                    destination.defense1 = "Def     " + String(pokemon.defense)
                    destination.spDef1 = "SpDef     " + String(pokemon.specialDefense)
                    destination.pokemonImage1 = UIImage(data: try! Data(contentsOf: URL(string: pokemon.imageUrl)!))
            }
        } else if segue.identifier == "popover" {
            if let destination = segue.destination as? PopOverViewController {
                destination.popDelegate = self
            }
        }
    }
    
    
    
    
    
    func filterContentForSearchText(_ searchText: String, lowerBounds: [Int]?, upperBounds: [Int]?, category: PokeType? = nil) {
      filteredPokemon = pokemonArray.filter { (pokemon: Pokemon) -> Bool in
        let doesCategoryMatch = pokemon.types.contains(category!)
        if isSearchBarEmpty {
            return doesCategoryMatch && (pokemon.speed > lowerBounds![0]) && (pokemon.speed < upperBounds![0]) && (pokemon.attack > lowerBounds![1]) && (pokemon.attack < upperBounds![1]) && (pokemon.health > lowerBounds![2]) && (pokemon.health < upperBounds![2]) && (pokemon.defense > lowerBounds![3]) && (pokemon.defense < upperBounds![3]) && (pokemon.specialDefense > lowerBounds![4]) && (pokemon.specialDefense < upperBounds![4]) && (pokemon.specialAttack > lowerBounds![5]) && (pokemon.specialAttack < upperBounds![5])
        } else {
            return doesCategoryMatch && (pokemon.name.lowercased().contains(searchText.lowercased()) && (pokemon.speed > lowerBounds![0]) && (pokemon.speed < upperBounds![0]) && (pokemon.attack > lowerBounds![1]) && (pokemon.attack < upperBounds![1]) && (pokemon.health > lowerBounds![2]) && (pokemon.health < upperBounds![2]) && (pokemon.defense > lowerBounds![3]) && (pokemon.defense < upperBounds![3]) && (pokemon.specialDefense > lowerBounds![4]) && (pokemon.specialDefense < upperBounds![4]) && (pokemon.specialAttack > lowerBounds![5]) && (pokemon.specialAttack < upperBounds![5]))
        }
      }
      tableView.reloadData()
      print(filteredPokemon.count)
    }


    override func viewDidLoad() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Pokemon"
        navigationItem.searchController = searchController
        definesPresentationContext = false
        searchController.searchBar.scopeButtonTitles = PokeType.allCases.map {$0.rawValue }
        searchController.searchBar.delegate = self
    }

}

extension TableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let category = PokeType.init(rawValue: searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
        filterContentForSearchText(searchBar.text!, lowerBounds: lowerBounds, upperBounds: upperBounds, category: category)
    }
}

extension TableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let category = PokeType.init(rawValue: searchBar.scopeButtonTitles![selectedScope])
        filterContentForSearchText(searchBar.text!, lowerBounds: lowerBounds, upperBounds: upperBounds, category: category)
    }
}
//
//extension TableViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//        let category = Candy.Category(rawValue:
//          searchBar.scopeButtonTitles![selectedScope])
//        filterContentForSearchText(searchBar.text!, category: category)
//      }
//    }


//func filterContentForSearchText(_ searchText: String, lowerBounds: [Int]?, upperBounds: [Int]?, category: PokeType? = nil) {
//  filteredPokemon = pokemonArray.filter { (pokemon: Pokemon) -> Bool in
//    let doesCategoryMatch = pokemon.types.contains(category!)
//    if isSearchBarEmpty {
//        return doesCategoryMatch && (pokemon.speed > lowerBounds![0]) && (pokemon.speed < upperBounds![0]) && (pokemon.attack > lowerBounds![1]) && (pokemon.attack < upperBounds![1]) && (pokemon.health > lowerBounds![2]) && (pokemon.health < upperBounds![2]) && (pokemon.defense > lowerBounds![3]) && (pokemon.defense < upperBounds![3]) && (pokemon.specialDefense > lowerBounds![4]) && (pokemon.specialDefense < upperBounds![4]) && (pokemon.specialAttack > lowerBounds![5]) && (pokemon.specialAttack < upperBounds![5])
//    }
//    if lowerBounds != nil && upperBounds != nil {
//        return (pokemon.name.lowercased().contains(searchText.lowercased()) && (pokemon.speed > lowerBounds![0]) && (pokemon.speed < upperBounds![0]) && (pokemon.attack > lowerBounds![1]) && (pokemon.attack < upperBounds![1]) && (pokemon.health > lowerBounds![2]) && (pokemon.health < upperBounds![2]) && (pokemon.defense > lowerBounds![3]) && (pokemon.defense < upperBounds![3]) && (pokemon.specialDefense > lowerBounds![4]) && (pokemon.specialDefense < upperBounds![4]) && (pokemon.specialAttack > lowerBounds![5]) && (pokemon.specialAttack < upperBounds![5]))
//    } else {
//        return (pokemon.name.lowercased().contains(searchText.lowercased()))
//    }
//  }
//  tableView.reloadData()
//  print(filteredPokemon.count)
//}
