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
        ZStack {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image
                        .resizable()
                        .frame(width: 300, height: 300)
                } placeholder: {
                    ProgressView()
                        .frame(width: 300, height: 300)
                }
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(character.name)
                        .font(.title)
                        .bold()
                    
                    Text("Status: " + character.status.rawValue)
                        .font(.title2)
                    
                    Text("Species: " + character.species.capitalized)
                        .font(.headline)
                    
                    Text("Gender: " + character.gender.rawValue)
                        .font(.headline)
                    
                    Text("Origin location: " + character.origin.name)
                        .font(.headline)
                    
                    Text("Current location: " + character.location.name)
                        .font(.headline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.horizontal)
            }
        }
        .navigationTitle(character.name)
    }
}

#Preview {
    NavigationView {
        CharacterView(character: dev.demoCharacher)
    }
}
