//
//  UIApplication.swift
//  RickAndMorty
//
//  Created by Rares Salomie on 8/11/25.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
