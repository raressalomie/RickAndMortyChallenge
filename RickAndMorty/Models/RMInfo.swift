//
//  RMInfo.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 6/11/25.
//

import Foundation

struct RMInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
