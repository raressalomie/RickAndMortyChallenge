//
//  RMResponse.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 5/11/25.
//

import Foundation

struct RMResponse: Codable {
    let info: RMInfo
    let results: [RMCharacter]
}
