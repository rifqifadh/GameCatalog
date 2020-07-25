//
//  DetailView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 03/07/20.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct DetailGameView: View {
    @StateObject private var detailViewModel: DetailViewModel
    
    var game: Games {
        detailViewModel.game
    }
    init(games: Games) {
        self._detailViewModel = StateObject(wrappedValue: DetailViewModel(game: games))
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                if detailViewModel.detailGames != nil {
                    VStack(alignment: .leading) {
                        AVPlayerView()
                            .frame(height: 200)
                        DetailContentView(game: detailViewModel.detailGames!)
                            .padding()
                        Divider()
                        VStack(alignment: .leading) {
                            Text("Screenshots")
                                .font(.headline)
                                .padding(.leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(detailViewModel.screenshots) { i in
                                        WebImage(url: URL(string: i.image))
                                            .resizable()
                                            .placeholder {
                                                Rectangle().foregroundColor(.gray)}
                                            .indicator(.activity)
                                            .cornerRadius(10)
                                            .scaledToFill()
                                            .frame(width: 240, height: 135)
                                            .padding(.horizontal, 5)
                                    }
                                    .padding(.bottom, 20)
                                    .edgesIgnoringSafeArea(.all)
                                }
                            }
                        }
                        .frame(alignment: .center)
                        .background(Color("Background"))
                        .navigationBarTitle(Text("\(detailViewModel.detailGames!.name)"), displayMode: .inline)
                    }
                } else {
                    ProgressViewCustom()
                }
            }
            .onAppear {
                detailViewModel.getDetailMovie()
            }
        }
    }
}

