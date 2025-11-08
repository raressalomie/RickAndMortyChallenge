//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 6/11/25.
//

import SwiftUI

struct CharacterView: View {
    let character: RMCharacter
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 300)
            } placeholder: {
                Color.red
                    .frame(width: 300, height: 300)
            }
            
            Text(character.name)
            Text(character.gender.rawValue)
            Text(character.species)
            Text(character.status.rawValue)
        }
        .navigationTitle(character.name)
    }
}

#Preview {
    NavigationView {
        CharacterView(character: dev.demoCharacher)
    }
}
