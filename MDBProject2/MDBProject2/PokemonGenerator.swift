//
//  PokemonGenerator.swift
//  MDBProject2
//
//  Created by Kanu Grover on 9/30/20.
//  Copyright © 2020 Kanu Grover. All rights reserved.
//

import Foundation

class PokemonGenerator {
    
    static func getPokemonArray() -> [Pokemon] {
        guard let path = Bundle.main.path(forResource: "pokemons", ofType: "json") else { print("Couldn't find Pokemon filepath")
            return []
        }
        guard let jsonData = try? NSData(contentsOfFile: path) as Data else {
            print("Couldn't load file")
            return []
        }
        
        let decoder = JSONDecoder()
        
        // Generally this is bad practice, but we need this decoding for the app to load, and the force unwrap will tell us why the error is occurring
        return try! decoder.decode([Pokemon].self, from: jsonData)
    }
}
