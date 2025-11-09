//
//  SearchBarView.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 8/11/25.
//

import Foundation
import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.white : Color.black
                )
            
            TextField("Search by name or symbol", text: $searchText)
                .foregroundStyle(Color.white)
                .autocorrectionDisabled(true)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundStyle(Color.white)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    
                }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black)
                .shadow(
                    color: Color.black,
                    radius: 10, x: 0, y: 0
                )
        )
        .padding()
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        SearchBarView(searchText: .constant(""))
        
        SearchBarView(searchText: .constant(""))
            .colorScheme(.dark)
    }
   
}

