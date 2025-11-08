//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 5/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = RMCharactersListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.characters) { character in
                    NavigationLink {
                        CharacterView(character: character)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: character.image)) { image in
                                image
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .clipShape(.circle)
                                    .padding()
                            } placeholder: {
                                ProgressView()
                            }

                            VStack(alignment: .leading) {
                                Text(character.name)
                                Text(character.species)
                            }
                        }
                    }
                    .onAppear {
                        if character.id == vm.characters.last?.id {
                            Task { await vm.fetchCharacters() }
                        }
                    }
                }
            }
            .navigationTitle("Characters")
            
            if vm.isLoading {
                HStack {
                    Spacer();
                    ProgressView();
                    Spacer()
                }
            }
        }
        .task {
            await vm.fetchCharacters()
        }
    }

}
#Preview {
    NavigationView {
        ContentView()
    }
}
