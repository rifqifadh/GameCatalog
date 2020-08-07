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
    @Published var searchGame: [Games] = []
    @Published var loading: Bool = false
    
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
        loading = true
        RawgService.fetch(from: .games, params: ["search": "\(keyword)"], response: GamesResponse.self) { (response) in
            if let results = response?.results {
                DispatchQueue.main.async { [weak self] in
                    self?.searchGame = results
                    self?.loading = false
                }
            }
        }
    }
    
}
