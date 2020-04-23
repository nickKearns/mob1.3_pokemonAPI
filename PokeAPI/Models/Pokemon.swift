//
//  Pokemon.swift
//  PokeAPI
//
//  Created by Nicholas Kearns on 4/23/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation




// MARK: - Welcome
struct Result: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

// MARK: - Result
struct Pokemon: Codable {
    let name: String
    let url: String
}


