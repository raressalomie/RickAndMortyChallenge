//
//  RMStatus.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 6/11/25.
//

import Foundation
import SwiftUI

enum RMStatus: String, Codable, CaseIterable, Identifiable {
    case all
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var id: RMStatus { self }
    
    var backgroundColor: Color {
        switch self {
        case .all:
                .black
        case .alive:
                .green
        case .dead:
                .red
        case .unknown:
                .purple
        }
    }
}
