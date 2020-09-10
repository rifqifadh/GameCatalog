//
//  GameViewModel.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import Foundation
import SwiftUI
import CoreData

class GameViewModel: ObservableObject {
	
	@Published var games: [Game] = []
	@Published var loadingState = LoadingState.loading
	@Published var loadFailed = false
	
	enum LoadingState {
		case loading, loaded, failed
	}
	
	init() {
		fetchGames()
	}
	
	func fetchGames(_ params: [String: String]? = nil) {
		loadingState = .loading
		RawgService.fetch(from: .games, params: params, response: GamesResponse.self) { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let response):
					self.games = response.results
					self.loadingState = .loaded
				case .failure(let error):
					self.loadFailed = true
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
}
