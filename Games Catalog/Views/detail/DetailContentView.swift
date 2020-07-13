//
//  DetailContentView.swift
//  Games Catalog
//
//  Created by Rifqi Fadh on 04/07/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailContentView: View {
    
    @State var moreDesc: Bool = false
    
    var game: DetailGame
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(game.name)")
                .font(.largeTitle)
                .fontWeight(.bold)
            Divider()
            Text("Description")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
            description
            Divider()
            detailGame
        }
    }
}

extension DetailContentView {
    private var description: some View {
        VStack {
            if moreDesc {
                Text("\(game.descriptionRaw ?? "")")
            } else {
                HStack(alignment: .lastTextBaseline) {
                    Text("\(game.descriptionRaw ?? "")")
                        .lineLimit(3)
                        .font(.body)
                        .padding(.trailing)
                        .overlay(
                            Button(action: {
                                self.moreDesc.toggle()
                            }, label: {
                                Text("more")
                            })
                            .padding(.horizontal)
                            .background(Color("Primary").opacity(0.8)),
                            alignment: .bottomTrailing
                        )
                }
            }
        }
    }
    
    private var detailGame: some View {
        VStack(alignment: .leading) {
            Text("Platform")
                .font(.headline)
                .padding(.bottom, 5)
            Text("\(game.platform)")
                .padding(.bottom)
            Text("Publisher")
                .font(.headline)
                .padding(.bottom, 5)
            Text("\(game.publisher)")
                .padding(.bottom)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Genre")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Text("\(game.genre)")
                        .padding(.bottom)
                    Text("Developer")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Text("\(game.developer)")
                        .frame(minWidth: 100, maxWidth: 200)
                }
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Metacritic")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ScoreBox(color: game.metacriticShape, score: String("\(game.metacritic)"))
                        .padding(.bottom)
                    Text("Release Date")
                        .font(.headline)
                        .padding(.bottom, 5)
                    Text("\(game.releaseDate ?? "-")")
                }
                Spacer()
            }
        }
    }
}

//struct DetailContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailContentView(game: static_games)
//    }
//}
