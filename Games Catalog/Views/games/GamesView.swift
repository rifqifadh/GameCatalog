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
                    ProgressView(String("Loading..."))
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .foregroundColor(.blue)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(Color("Primary"))
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
                                .foregroundColor(Color("PrimaryVariant"))
                                .preferredColorScheme(.dark)
                            }
                        }
                        .listRowBackground(Color("Primary"))
                    }
                    .navigationBarTitle(Text("Games"))
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
