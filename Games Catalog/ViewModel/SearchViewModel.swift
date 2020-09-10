//
//  SearchViewModel.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 05/07/20.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
	
	@Published var searchText = ""
	@Published var searchGame: [Game] = []
	@Published var loadingState = LoadingState.loading
	@Published var loadFailed = false
	
	enum LoadingState {
		case loading, loaded, failed
	}
	
	private var searchCancellable: AnyCancellable?
	
	init() {
		self.fetchSearch()
		searchCancellable = $searchText
			.debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
			.sink(receiveValue: { text in
				self.fetchSearch(text)
			})
	}
	
	func fetchSearch(_ keyword: String = "") {
		loadingState = .loading
		RawgService.fetch(from: .games, params: ["search": keyword], response: GamesResponse.self) { result in
			
			DispatchQueue.main.async {
				switch result {
				case .success(let response):
					self.searchGame = response.results
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
