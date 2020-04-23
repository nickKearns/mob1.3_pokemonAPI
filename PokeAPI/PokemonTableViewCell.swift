//
//  PokemonTableViewCell.swift
//  PokeAPI
//
//  Created by Nicholas Kearns on 4/23/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    

    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    var pokemon: Pokemon? {
        didSet {
            guard let pokemon = pokemon else {return}
            self.nameLabel.text = pokemon.name
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
