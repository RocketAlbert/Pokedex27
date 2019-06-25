//
//  pokemon.swift
//  Pokedex27
//
//  Created by Albert Yu on 6/25/19.
//  Copyright © 2019 AlbertLLC. All rights reserved.
//

import Foundation

struct TopLevelDict: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case abilities
        case spritesDictionary = "sprites"
    }
    
    let name: String
    let id: Int
    let abilities: [AbilityDictionary]
    let spritesDictionary: [SpritesDictionary]
}

struct AbilityDictionary: Decodable {
    let ability: Ability
    
    struct Ability: Decodable {
        let name: String
    }
}

struct SpritesDictionary: Decodable {
    let image: URL
    
    // CodingKeys must be capitalized. CodingKey not CodingKeys. Double checked
    private enum CodingKeys: String, CodingKey {
        case image = "front_shiny"
    }
}
