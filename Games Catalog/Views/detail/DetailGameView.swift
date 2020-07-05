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
                        ZStack(alignment: .bottomLeading) {
                            WebImage(url: URL(string: detailViewModel.detailGames!.backgroundImage)!)
                                .resizable()
                                .background(Color(.black))
                                .frame(height: 200)
                            RatingView(rating: $detailViewModel.rating)
                                .padding()
                        }
                        DetailContentView(game: detailViewModel.detailGames!)
                            .padding()
                        VStack(alignment: .leading) {
                            Text("Screenshots")
                                .font(.headline)
                                .padding(.leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(detailViewModel.screenshots) { i in
                                        WebImage(url: URL(string: i.image))
                                            .resizable()
                                            .scaledToFit()
                                            .overlay(
                                                RoundedRectangle(cornerRadius:10).stroke(Color("Secondary"),lineWidth: 6))
                                            .cornerRadius(10)
                                            .frame(width: 240, height: 135)
                                            .padding(.horizontal, 5)
                                    }
                                    .edgesIgnoringSafeArea(.all)
                                }
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .background(Color("Primary"))
                        .navigationBarTitle(Text("\(detailViewModel.detailGames!.name)"), displayMode: .inline)
                    }
                } else {
                    VStack {
                        ProgressView(String("Loading..."))
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .foregroundColor(.blue)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color("Primary"))
                }
            }
            .onAppear {
                detailViewModel.getDetailMovie()
            }
        }
    }
}


//struct DetailView_Preview: PreviewProvider {
//    static var previews: some View {
//        DetailGameView(game: static_games)
//    }
//}
