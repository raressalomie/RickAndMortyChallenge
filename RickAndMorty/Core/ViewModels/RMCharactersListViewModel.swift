//
//  RMCharactersListViewModel.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 7/11/25.
//

import SwiftUI

@Observable
class RMCharactersListViewModel {    
    private var allCharacters: [RMCharacter] = []
    private var characters: [RMCharacter] = []
    var isLoading = false
    var searchText: String = ""
    private var nextCharactersUrl: String?
    private var canLoadMore = false
    private let dataService = RMCharactersDataService()
    var statusSelection = RMStatus.all
    var filteredCharacters: [RMCharacter] {
        filterCharacters(by: statusSelection)
        return searchCharacters(for: searchText)
    }
    
    func filterCharacters(by status: RMStatus){
        characters = allCharacters
        if status == .all {
            return 
        } else {
            characters = characters.filter { character in
                character.status == status
            }
        }
    }
    
    func searchCharacters(for searchTerm: String) -> [RMCharacter] {
        if searchTerm.isEmpty {
            return characters
        } else {
            return characters.filter { character in
                character.name.localizedStandardContains(searchTerm)
            }
        }
    }
    
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
            allCharacters.append(contentsOf: response.results)
            characters = allCharacters
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
