//
//  GamesView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GamesView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            if viewModel.loading {
                ProgressViewCustom()
            } else {
                NavigationView {
                    List {
                        ForEach(viewModel.games) { item in
                            ZStack(alignment: .center) {
                                GamesRow(games: item)
                                    .cornerRadius(10)
                                NavigationLink(destination: DetailGameView(id: item.id)) {
                                    EmptyView()
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.bottom, 10)
                        .listRowBackground(Color("Background"))
                    }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle(Text("Games Catalogue"), displayMode: .automatic)
                    .navigationBarItems(trailing:
                                            Group {
                                                HStack(spacing: 12) {
                                                    Image(systemName: "heart")
                                                }
                                            })
                }
            }
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
