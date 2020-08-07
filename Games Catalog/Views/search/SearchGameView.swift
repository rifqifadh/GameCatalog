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
                List {
                    Section(header: SearchField(searchText: $viewModel.searchText, placeholder: "Search a Game")) {
                        if viewModel.loading {
                            ProgressViewCustom()
                                .listRowBackground(Color("Background"))
                                .frame(minHeight: 0, maxHeight: .infinity)
                        } else {
                            if viewModel.searchText.isEmpty {
                                ForEach(viewModel.searchGame) { game in
                                    NavigationLink(destination: DetailGameView(id: game.id)) {
                                        Text("\(game.name)")
                                    }
                                }
                                .listRowBackground(Color("Background"))
                            } else {
                                ForEach(viewModel.searchGame) { game in
                                    NavigationLink(destination: DetailGameView(id: game.id)) {
                                        Text("\(game.name)")
                                    }
                                }
                                .listRowBackground(Color("Background"))
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle(Text("Search"))
        }
    }
}

struct SearchGameView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGameView()
    }
}
