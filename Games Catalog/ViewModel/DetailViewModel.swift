//
//  DetailViewModel.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 04/07/20.
//

import Foundation
import CoreData

class DetailViewModel: ObservableObject {
    
    let game: Games
//    let context = PersistentContainer.persistentContainer.viewContext
    @Published var detailGames: DetailGame?
    @Published var screenshots: [Screenshot] = []
    @Published var loading: Bool = false
    @Published var rating: Int = 0
    
    init(game: Games) {
        self.game = game
    }
    
    deinit {
        self.detailGames = nil
    }
    
    func getDetailMovie() {
        loading = true
        if let id = game.id {
            RawgService.fetch(from: .detail(id: id), response: DetailGame.self) { [weak self](response) in
                if let game = response {
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
    }
    
    func saveToFavorite(_ context: NSManagedObjectContext) {
        let fav = Favorite(context: context)
        fav.id = Int32(game.id ?? 0)
        fav.name = game.name
        fav.genre = game.genre
        fav.backgroundImage = game.backgroundImage
        
        do {
            try context.save()
        } catch {
            fatalError("Error Save data")
        }
    }
}
