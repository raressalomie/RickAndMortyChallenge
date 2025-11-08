//
//  RMCharacterDataService.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 7/11/25.
//

import Foundation

class RMCharactersDataService {
    func fetchCharacters(urlString: String = "https://rickandmortyapi.com/api/character") async throws -> RMResponse {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(RMResponse.self, from: data)
        return response
    }
}
