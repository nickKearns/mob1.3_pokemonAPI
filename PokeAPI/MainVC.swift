//
//  MainVC.swift
//  PokeAPI
//
//  Created by Nicholas Kearns on 4/23/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    let startingURL: String = "https://pokeapi.co/api/v2/pokemon"
    var pokemonList: [Pokemon] = [] {
        didSet {
            pokemonTableView.reloadData()
        }
    }
    let nextURL: String = ""
    
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        
        let pokemon = pokemonList[indexPath.row]
        
        cell.nameLabel.text = pokemon.name
        return cell
    }
    
    
    
    
}
