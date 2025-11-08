//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 6/11/25.
//

import Foundation

struct RMCharacter: Codable, Identifiable {
    let id: Int
    let name: String
    let status: RMStatus
    let species: String
    let type: String
    let gender: RMGender
    let origin, location: RMLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
