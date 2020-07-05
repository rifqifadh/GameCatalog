//
//  DetailViewModel.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 04/07/20.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    let game: Games
    @Published var detailGames: DetailGame?
    @Published var screenshots: [Screenshot] = []
    @Published var loading: Bool = false
    @Published var loadingScreenshot: Bool = false
    @Published var rating: Int = 0
    
    init(game: Games) {
        self.game = game
    }
    
    func getDetailMovie() {
        loading = true
        loadingScreenshot = true
        if let id = game.id {
            RawgService.fetch(from: .detail(id: id), response: DetailGame.self) { [weak self](response) in
                if let game = response {
                    //                    DispatchQueue.global(qos: .userInitiated)
                    DispatchQueue.main.async {
                        self?.detailGames = game
                        self?.rating = Int(game.rating ?? 0)
                    }
                }
            }
            RawgService.fetch(from: .screenshots(id: id), response: ScreenshotResponse.self) { [weak self](response) in
                if let response = response {
                    DispatchQueue.main.async {
                        self?.screenshots = response.results
                    }
                }
            }
        } else {
            self.detailGames = nil
        }
        loading = false
        loadingScreenshot = false
    }
}
