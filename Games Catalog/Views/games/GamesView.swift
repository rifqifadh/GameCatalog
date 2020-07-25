//
//  GamesView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 01/07/20.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            if viewModel.loading {
                VStack() {
                    ProgressViewCustom()
                }
            } else {
                NavigationView {
                    List {
                        ForEach(viewModel.games) { item in
                            ZStack(alignment: .center) {
                                GamesRow(games: item)
                                    .cornerRadius(10)
                                NavigationLink(destination: DetailGameView(games: item)) {
                                    EmptyView()
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .listRowBackground(Color("Background"))
                        .padding(.vertical, 10)
                    }
                    .navigationBarTitle(Text("Games Catalogue"))
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
