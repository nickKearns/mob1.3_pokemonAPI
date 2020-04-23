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
    var nextURL: String = ""
    
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var networkManager = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
//        pokemonTableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "pokemonCell")
        updateFeed(url: startingURL)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func updateFeed(url: String) {
        networkManager.fetchPokemon(givenUrl: url) { result in
            switch result {
            case let .success(APIResult):
                self.pokemonList = APIResult.results
                self.nextURL = APIResult.next
            case let .failure(error):
                print(error)
            }
            
            
        }
    }
}



extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonTableViewCell
        
        let pokemon = pokemonList[indexPath.row]
        
        cell.pokemon = pokemon
            
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
            if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                updateFeed(url: self.nextURL)
        }
    }
    
    
}

