//
//  DetailView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 03/07/20.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import AVKit

struct DetailGameView: View {
    @Environment(\.managedObjectContext) var moc
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
                        if let url = URL(string: detailViewModel.detailGames?.clip?.clip ?? "") {
                            VideoPlayer(player: AVPlayer(url: url))
                                .frame(height: 200)
                        } else {
                            WebImage(url: URL(string: detailViewModel.detailGames?.backgroundImage ?? "")!)
                                .resizable()
                                .renderingMode(.original)
                                .placeholder {
                                    Rectangle().foregroundColor(.gray)}
                                .indicator(.activity)
                                .frame(height: 200)
                        }
                        DetailContentView(game: detailViewModel.detailGames!)
                            .padding([.top, .leading, .trailing])
                        Divider()
                        //                        Button(action: {
                        //                            let fav = Favorite(context: self.moc)
                        //                            fav.id = Int32(game.id ?? 0)
                        //                            fav.name = game.name
                        //                            fav.genre = game.genre
                        //                            fav.backgroundImage = game.backgroundImage
                        //
                        //                            detailViewModel.saveToFavorite(self.moc)
                        //
                        //                            do {
                        //                                try self.moc.save()
                        //                            } catch {
                        //                                fatalError("Error Save data")
                        //                            }
                        //                        }) {
                        //                            Text("Add to Favorite")
                        //                        }
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
                                    .edgesIgnoringSafeArea(.all)
                                }
                            }
                        }
                        .padding(.bottom, 20)
                        .frame(alignment: .center)
                        .background(Color("Background"))
                        .navigationBarItems(
                            trailing:
                                Button(action: {
                                    detailViewModel.saveToFavorite(self.moc)
                                }) {
                                    Image(systemName: "star.fill")
                                }
                        )
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

