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
                ForEach(vm.filteredCharacters) { character in
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
                                    .frame(width: 70, height: 70)
                                    .padding()
                            }

                            VStack(alignment: .leading) {
                                Text(character.name)
                                    .font(.title2)
                                Text(character.species)
                                Text(character.status.rawValue.capitalized)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 5)
                                    .background(character.status.backgroundColor)
                                    .clipShape(.capsule)
                            }
                        }
                    }
                    .onAppear {
                        if character.id == vm.filteredCharacters.last?.id {
                            Task { await vm.fetchCharacters() }
                        }
                    }
                }
            }
            .navigationTitle("Characters")
            .searchable(text: $vm.searchText)
            .autocorrectionDisabled()
            .animation(.default, value: vm.searchText)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $vm.statusSelection.animation()) {
                            ForEach(RMStatus.allCases) {
                                status in
                                Text(status.rawValue.capitalized).tag(status)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            
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
