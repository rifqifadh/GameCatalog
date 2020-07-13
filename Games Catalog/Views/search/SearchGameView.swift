//
//  SearchGameView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 05/07/20.
//

import SwiftUI

struct SearchGameView: View {
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    Section(header: SearchField(searchText: $viewModel.searchText, placeholder: "Search a Game")) {
                        if viewModel.searchText.isEmpty {
                            ForEach(viewModel.searchGame) { game in
                                NavigationLink(destination: DetailGameView(games: game)) {
                                    Text("\(game.name)")
                                }
                            }
                            .listRowBackground(Color("PrimaryVariant"))
                        } else {
                            ForEach(viewModel.searchGame) { game in
                                NavigationLink(destination: DetailGameView(games: game)) {
                                    Text("\(game.name)")
                                }
                            }
                            .listRowBackground(Color("PrimaryVariant"))
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle(Text("Search"))
            }
        }
    }
}

struct SearchGameView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGameView()
    }
}
