//
//  ViewController.swift
//  JSON
//
//  Created by morse on 2/13/21.
//

import UIKit

struct Pokemon: Decodable {
    let name: String
    let abilities: [AbilityType]
    let base_experience: Int
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

