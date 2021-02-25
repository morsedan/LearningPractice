//
//  ViewController.swift
//  JSON
//
//  Created by morse on 2/13/21.
//

import UIKit

struct Pokemon: Decodable {
    let abilities: [AbilityType]
    let base_experience: Int
    let forms: [Form]
    let game_indices: [GameIndex]
    let height: Int
    let held_items: [HeldItem]
    let id: Int
    let is_default: Bool
    let location_area_encounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let species: Species
    let sprites: Sprites
    /*
     Still need to finish Sprites & Types
     */
    let weight: Int
}

struct Sprites: Decodable {
    let back_default: String?
    let back_female: String?
    let back_shiny: String?
    let back_shiny_default: String?
    let front_default: String?
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
    /*
     Still need to finish Sprite Type!
     */
}

struct Species: Decodable {
    let name: String
    let url: String
}

struct Move: Decodable {
    let move: MoveType
    let version_group_details: [VersionGroupDetial]
}

struct MoveType: Decodable {
    let name: String
    let url: String
}

struct VersionGroupDetial: Decodable {
    let level_learned_at: Int
    let move_learn_method: Method
    let version_group: VersionGroup
}

struct VersionGroup: Decodable {
    let name: String
    let url: String
}

struct Method: Decodable {
    let name: String
    let url: String
}

struct HeldItem: Decodable {
    let item: Item
    let version_details: [VersionDetail]
}

struct VersionDetail: Decodable {
    let rarity: Int
    let version: Version
}

struct Item: Decodable {
    let name: String
    let url: String
}

struct GameIndex: Decodable {
    let game_index: Int
    let version: Version
}

struct Version: Decodable {
    let name: String
    let url: String
}

struct Form: Decodable {
    let name: String
    let url: String
}

struct AbilityType: Decodable {
    let ability: Ability
    let is_hidden: Bool
    let slot: Int
}

struct Ability: Decodable {
    let name: String
    let url: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
         Possible api's:
         - Pokemon
         - Weather
         - Stocks
         - Stackoverflow
         - Github
         */
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/132")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error:", error)
            }
            if let response = response as? HTTPURLResponse {
                print("Status:", response.statusCode)
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let pokemon  = try decoder.decode(Pokemon.self, from: data)
                    print(String(data: data, encoding: .utf8))
                    print(pokemon.name, pokemon.abilities.count)
                } catch {
                    print("Failed to decode:", error)
                }
            }
        }.resume()
    }


}

