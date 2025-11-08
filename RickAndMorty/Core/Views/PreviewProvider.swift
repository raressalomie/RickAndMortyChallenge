//
//  PreviewProvider.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 6/11/25.
//

import Foundation
import SwiftUI

#if DEBUG
let dev = DeveloperPreview.instance
#endif

extension PreviewProvider { 
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {}
    
    let demoCharacher = RMCharacter(
        id: 1,
        name: "Rick Sanchez",
        status: .alive,
        species: "human",
        type: "",
        gender: .male,
        origin: RMLocation(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"),
        location: RMLocation(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2"
        ],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z")
}
