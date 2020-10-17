//
//  PokemonCollectionViewController.swift
//  MDBProject2
//
//  Created by Kanu Grover on 10/8/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import UIKit


class PokemonCollectionViewController: UICollectionViewController {
    
    private let reuseIdentifier = "CollectionCell"
    let pokemonArray = PokemonGenerator.getPokemonArray()
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokemonCollectionViewCell
        let currentPokemon = pokemonArray[indexPath.row]
        cell.pokemonName.text = currentPokemon.name
        cell.pokemonID.text = String(currentPokemon.id)
        let url = URL(string: currentPokemon.imageUrl)
        cell.pokemonImage?.image = UIImage(data: try! Data(contentsOf: url!))
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        performSegue(withIdentifier: "collectionDetail", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "collectionDetail" {
            if let destination = segue.destination as? PokemonViewController {
                if let rowIndex = collectionView.indexPathsForSelectedItems?[0].row {
                    destination.name1 = pokemonArray[rowIndex].name
                    destination.id1 = String(pokemonArray[rowIndex].id)
                    destination.speed1 = "Spd     " + String(pokemonArray[rowIndex].speed)
                    destination.attack1 = "Atk     " + String(pokemonArray[rowIndex].attack)
                    destination.hp1 = "HP     " + String(pokemonArray[rowIndex].health)
                    destination.spAttack1 = "SpAtk     " + String(pokemonArray[rowIndex].specialAttack)
                    destination.defense1 = "Def     " + String(pokemonArray[rowIndex].defense)
                    destination.spDef1 = "SpDef     " + String(pokemonArray[rowIndex].specialDefense)
                    destination.pokemonImage1 = UIImage(data: try! Data(contentsOf: URL(string: pokemonArray[rowIndex].imageUrl)!))
                }
            }
        }
    }


}
