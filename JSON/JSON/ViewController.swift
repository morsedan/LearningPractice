//
//  ViewController.swift
//  JSON
//
//  Created by morse on 2/13/21.
//

import UIKit

struct Pokemon: Decodable {
    let abilities: [AbilityType]
    let baseExperience: Int
    let forms: [Form]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [HeldItem]
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
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
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyDefault: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
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
    let versionGroupDetails: [VersionGroupDetial]
}

struct MoveType: Decodable {
    let name: String
    let url: String
}

struct VersionGroupDetial: Decodable {
    let levelLearnedAt: Int
    let moveLearnMethod: Method
    let versionGroup: VersionGroup
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
    let versionDetails: [VersionDetail]
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
    let gameIndex: Int
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
    let isHidden: Bool
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
                decoder.keyDecodingStrategy = .convertFromSnakeCase
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

