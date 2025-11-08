//
//  RMCharactersListViewModel.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 7/11/25.
//

import SwiftUI

@Observable
class RMCharactersListViewModel {    
    var characters: [RMCharacter] = []
    var isLoading = false
    private var nextCharactersUrl: String?
    private var canLoadMore = false
    private let dataService = RMCharactersDataService()
    
    func fetchCharacters() async {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let response: RMResponse
            if canLoadMore {
                guard let nextCharactersUrl, !nextCharactersUrl.isEmpty else { return }
                response = try await dataService.fetchCharacters(urlString: nextCharactersUrl)
                print("More characters loaded")
            } else {
                response = try await dataService.fetchCharacters()
                print("Characters loaded")
            }
            characters.append(contentsOf: response.results)
            if response.info.next != nil {
                canLoadMore = true
                print("Can load more characters")
                nextCharactersUrl = response.info.next
            } else {
                canLoadMore = false
            }
        } catch {
            print("Error fetching: \(error)")
        }
        
        isLoading = false
    }
}
