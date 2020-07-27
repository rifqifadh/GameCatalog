//
//  DetailViewModel.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 04/07/20.
//

import Foundation
import CoreData
import SwiftUI

class DetailViewModel: ObservableObject {
    
    let game: Games
    @Published var detailGames: DetailGame?
    @Published var screenshots: [Screenshot] = []
    @Published var loading: Bool = false
    @Published var isFav: Bool = false
    
    init(game: Games) {
        self.game = game
    }
    
    //    deinit {
    //        self.detailGames = nil
    //    }
    
    func getDetailMovie() {
        loading = true
        //        if let id = game.id {
        RawgService.fetch(from: .detail(id: game.id), response: DetailGame.self) { [weak self](response) in
            if let game = response {
                DispatchQueue.main.async {
                    self?.detailGames = game
                }
            }
        }
        RawgService.fetch(from: .screenshots(id: game.id), response: ScreenshotResponse.self) { [weak self](response) in
            if let response = response {
                DispatchQueue.main.async {
                    self?.screenshots = response.results
                }
            }
        }
        //        } else {
        //            self.detailGames = nil
        //        }
        loading = false
    }
    
    func saveToFavorite(_ context: NSManagedObjectContext) {
        let fav = Favorite(context: context)
        fav.id = Int32(game.id)
        fav.name = game.name
        fav.genre = game.genre
        fav.backgroundImage = game.backgroundImage
        
        do {
            try context.save()
            isFav = true
        } catch {
            fatalError("Error Save data")
        }
    }
    
    func checkIsFav(_ entity: FetchedResults<Favorite>) {
        if entity.count > 0 {
            isFav = true
        } else {
            isFav = false
        }
    }
    
    func deleteFav(from entity: FetchedResults<Favorite>,_ context: NSManagedObjectContext) {
        context.delete(entity[0])
        isFav = false
        do {
            try context.save()
        } catch {
            fatalError("Error Delete Favorite")
        }
    }
}
