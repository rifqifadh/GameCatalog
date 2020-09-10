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
	@Published var detailGames: DetailGame?
	@Published var screenshots: [Screenshot] = []
	@Published var isFav: Bool = false
	@Published var loadingState = LoadingState.loading
	
	enum LoadingState {
		case loading, loaded, failed
	}
	
	let id: Int
	
	init(id: Int) {
		self.id = id
	}
	
	func getDetailMovie() {
		loadingState = .loading
		RawgService.fetch(from: .detail(id: id), response: DetailGame.self) { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let response):
					self.detailGames = response
					self.loadingState = .loaded
				case .failure(let error):
					switch error {
					case .badURL:
						print("Bad URL")
						self.loadingState = .failed
					case .requestFailed:
						print("Network problems")
						self.loadingState = .failed
					case .unknown:
						print("Unknown error")
						self.loadingState = .failed
					}
				}
			}
		}
		
		RawgService.fetch(from: .screenshots(id: id), response: ScreenshotResponse.self) { result in
			
			DispatchQueue.main.async {
				switch result {
				case .success(let response):
					self.screenshots = response.results					
				case .failure(let error):
					switch error {
					case .badURL:
						print("Bad URL")
						self.loadingState = .failed
					case .requestFailed:
						print("Network problems")
						self.loadingState = .failed
					case .unknown:
						print("Unknown error")
						self.loadingState = .failed
					}
				}
			}
		}
	}
	
	func saveToFavorite(_ context: NSManagedObjectContext) {
		let fav = Favorite(context: context)
		fav.id = Int32(detailGames?.id ?? 0)
		fav.name = detailGames?.name
		fav.genre = detailGames?.genre
		fav.backgroundImage = detailGames?.backgroundImage
		fav.rating = Int16(detailGames!.ratingRoundFormat)
		
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
