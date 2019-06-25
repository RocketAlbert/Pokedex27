//
//  PokemonController.swift
//  Pokedex27
//
//  Created by Albert Yu on 6/25/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

import Foundation

class PokemonController {
    // Singleton
    static let sharedInstance = PokemonController()
    
    // @escaping comes from Objective C
    
    // Create
    func fetchPokemonWith(searchTerm: String, completion: @escaping (TopLevelDict?) -> Void) {
        
        // Build URL
        let baseURL = URL(string: "https://pokeapi.co/api/v2")
        
        // Add /pokemon/
        let pokemonPathComponentURL = baseURL?.appendingPathComponent("pokemon")
        
        // Add /searchTerm
        guard let finalURL = pokemonPathComponentURL?.appendingPathComponent(searchTerm) else {return}
        // print(finalURL)
        
        
        // URL must be unwrapped

        // In completion handler, the paramater names will be what we want to call these when they return
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            // Handle the error
            if let error = error {
                print("There was an error \(error.localizedDescription)")
            }
            
            // Check if there's data
            // or "data != nil "
            // or "if data"
            if let data = data {
                // decode the data
                do {
                    let pokemon = try JSONDecoder().decode(TopLevelDict.self, from: data)
                    completion(pokemon)
                } catch {
                    print("Error Fetching pokemon!")
                    completion(nil); return
                }
            }
            
            // Handle the data
        } .resume()
    }
} // End of class
