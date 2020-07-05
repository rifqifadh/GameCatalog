//
//  GameViewModel.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published var games: [Games] = []
    @Published var loading: Bool = false
    
    init() {
        loading = true
        RawgService.fetch(from: .games,params: ["ordering": "popularity"]  ,response: GamesResponse.self) {[weak self] (response) in
            if let results = response?.results {
                DispatchQueue.main.async {
                    self?.games = results
                    self?.loading = false
                }
            }
        }
    }
}
